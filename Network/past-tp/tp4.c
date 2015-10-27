#include <stdlib.h>
#include <stdio.h>
#include <pthread.h>
int var=5;
void *mythread(void *arg){
	
	var+=1;
	printf("%d",var);
	pthread_exit(0);
}
void *mythreadbis(void *arg){
	
	var+=1;
	printf("%d",var);
	pthread_exit(0);
}

main(){
	pthread_t th1, th2;
	pthread_create(&th1,NULL,mythread,"1");
	pthread_create(&th2,NULL,mythreadbis,"2");
	pthread_join(th1,NULL);
	pthread_join(th2,NULL);
}
