#include "types.h"
#include "stat.h"
#include "user.h"
#include "fcntl.h"
#include "processInfo.h"

int main(void)
{
	struct processInfo* p = (struct processInfo*)malloc(sizeof(struct processInfo));
	int i, max_pid;

	printf(1, "PID\tPPID\tSIZE\tNumber of Context Switch\n");

	max_pid =  get_max_pid();
	for(i = 0; i <= max_pid; i++) {
		if(get_proc_info(i, p) < 0)
			continue;

		printf(1, "%d\t%d\t%d\t%d\n", i, p->ppid, p->psize, p->numberContextSwitches);
	}

	exit();
}
