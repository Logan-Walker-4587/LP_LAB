#include<stdio.h>
#include<string.h>

int main()
{
     char input[100];
     int flag = 0;
     char c=input[0];

     
     printf("Enter a string :");
     scanf("%s",input);
     
     if (input[strlen(input)-1]=='1')
        flag =1;
    
     

     if (flag)
     {
       printf("Accepted");
     }
     else
     {
       printf("Not accepted");
     }
     return 0;
}
