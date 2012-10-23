#!/usr/sbin/dtrace -s
/**
 * Trace the file descriptor life cycle of all processes
 * on a machine
 *
 * Author: Dave Eddy <dave@daveeddy.com>
 * Date: April 2012
 *
 * Created at Voxer working with bgregg, mranney, and mzeller
 * to solve some node issues
 */

#pragma D option quiet
#pragma D option switchrate=10hz

syscall::open*:entry
/execname != "dtrace"/
{
	this->title = "Opening";

	self->open_s = timestamp;
	self->file = copyinstr(arg0);

	printf("[%Y] %10s : %-20s %-50s [pid %d]\n",
		walltimestamp, execname, this->title, self->file, pid);
}

syscall::open*:return
/self->open_s/
{
	this->title = "Finished Opening";

	my_file[pid, arg0] = self->file;
	my_time[pid, arg0] = self->open_s;

	this->delta_ns = timestamp - self->open_s;
	this->delta_us = this->delta_ns / 1000;
	this->delta_ms = this->delta_us / 1000;

	printf("[%Y] %10s : %-20s %-50s [pid %d | fd %d] (%d ns / %d us / %d ms)\n",
		walltimestamp, execname, this->title, self->file, pid, arg0,
		this->delta_ns, this->delta_us, this->delta_ms);

	self->open_s = 0;
	self->file = 0;
}

syscall::read:entry
/my_time[pid, arg0]/
{
	this->title = "Started Reading";

	self->read_time = timestamp;
	self->read_fd_num = arg0;
	self->read_filename = my_file[pid, arg0];

	printf("[%Y] %10s : %-20s %-50s [pid %d | fd %d]\n",
		walltimestamp, execname, this->title, self->read_filename,
		pid, self->read_fd_num);
}

syscall::read:return
/self->read_time/
{
	this->title = "Finished Reading";

	this->delta_ns = timestamp - self->read_time;
	this->delta_us = this->delta_ns / 1000;
	this->delta_ms = this->delta_us / 1000;

	printf("[%Y] %10s : %-20s %-50s [pid %d | fd %d] (%d ns / %d us / %d ms)\n",
		walltimestamp, execname, this->title, self->read_filename, pid, self->read_fd_num,
		this->delta_ns, this->delta_us, this->delta_ms);

	self->read_time = 0;
	self->read_fd_num = 0;
	self->read_filename = 0;
}

syscall::close*:entry
/my_time[pid, arg0]/
{
	this->title = "Closing";

	self->filename = my_file[pid, arg0];
	self->delta = my_time[pid, arg0];
	self->new_fd_num = arg0;
	self->close_s = timestamp;

	printf("[%Y] %10s : %-20s %-50s [pid %d | fd %d]\n",
		walltimestamp, execname, this->title, self->filename, pid, self->new_fd_num);

	my_file[pid, arg0] = 0;
	my_time[pid, arg0] = 0;
}

syscall::close*:return
/self->delta/
{
	this->title = "Closed";

	this->delta_ns = timestamp - self->close_s;
	this->delta_us = this->delta_ns / 1000;
	this->delta_ms = this->delta_us / 1000;

	this->duration_delta_ns = timestamp - self->delta;
	this->duration_delta_us = this->duration_delta_ns / 1000;
	this->duration_delta_ms = this->duration_delta_us / 1000;


	printf("[%Y] %10s : %-20s %-50s [pid %d | fd %d] (%d ns / %d us / %d ms) Duration (%d ns / %d us / %d ms)\n",
		walltimestamp, execname, this->title, self->filename, pid, self->new_fd_num,
		this->delta_ns, this->delta_us, this->delta_ms,
		this->duration_delta_ns, this->duration_delta_us, this->duration_delta_ms);

	self->delta = 0;
	self->filename = 0;
	self->new_fd_num = 0;
}
