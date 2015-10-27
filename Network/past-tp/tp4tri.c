/*   programme deuxthreadsenpartagedonnee.c 
 *        auteur Gilles GOUBET, écrit en mars 2010
 *             Ce programme crée un processus qui execute deux threads
 *             */
#include <stdlib.h>
#include <stdio.h>
#include <time.h>
#include <pthread.h>
/* Les deux threads */
pthread_t th1,th2;  
/* La donnee partagee sans exclusion mutuelle */
int donnee_critique;
/* La structure pour attendre n nano secondes */
struct timespec attente = {0,} ;
/* 
 *   La fonction laThread contient le code du module
 *   */
void * laThread(void * arg)
{ int i; 
		  char *ch;
		    struct sched_param p;
			  long nbNano;
			    ch=(char *)arg;
				  for(i=1;i<=10;i++)
						     { 
									     if ( ch[0] == '1' ) 
												             {
																	              donnee_critique++;
																				              }
										     else 
													             {
																		 donnee_critique--;
																		             }
											     printf("Donnee critique apres modif thread %c : %5d\n",ch[0],donnee_critique);
												     nbNano=rand();
													     attente.tv_nsec=nbNano;
														     nanosleep(&attente,NULL);
															    }
				    return (void *)0;
}
main()
{
		  srand(time(NULL));
		    /* creation du premier thread */
		    if ( pthread_create(&th1,NULL,laThread,"1"))
					   {
							       printf("erreur de creation du premier thread\n");
								   return 1;
					   }
			/* creation du deuxième thread */
			  if ( pthread_create(&th2,NULL,laThread,"2"))
					     {
								     printf("erreur de création du second thread\n");
									     return 1;
										    }
			    if (!pthread_join(th1,NULL))
						  {
								     printf("Le thread est termine\n");
									   }
				  if (!pthread_join(th2,NULL))
						    {
									   printf("Le thread est termine\n");
									     }
}
