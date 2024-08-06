#include<stdio.h>
#include<string.h>

int main()
{
     char input[100];
     int foundstart = 0;
     int foundend = 0;
     char c=input[0];

     
     printf("Enter a string :");
     scanf("%s",input);
     
     
    
     for (int i=0;i<strlen(input);i++)
     {
      c = input[i];
      if (c == 'a' || c=='b'){
           if (c=='a' && i==(strlen(input)-2))
           {
             foundstart = 1;
             if (input[i+1] == 'b')
             {
               foundend = 1;
             }
           }
           else if (c=='b' && i==(strlen(input)-2))
           {
             foundstart = 1;
             if (input[i+1]=='a')
                foundend = 1;
           }
      }
      else
          {
            foundstart = 0;
            foundend = 0;
            break;
          }
     
     }

     if (foundstart && foundend)
     {
       printf("Accepted");
     }
     else
     {
       printf("Not accepted");
     }
     return 0;
}
