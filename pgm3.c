#include<stdio.h>
#include<string.h>

int main()
{
     char input[100];
     int even = 0;
     int odd = 0;
     char c=input[0];

     
     printf("Enter a string :");
     scanf("%s",input);
     
     
    
     for (int i=0;i<strlen(input);i++)
     {
      c = input[i];
      if (c == '0' || c=='1'){
           if (c == '0')
           {
             even++;
           }
           if (c == '1')
           {
             odd++;
           }
      }
      else
          {
            even = -1;
            odd = -1;
            break;
          }
     
     }
     

     if (even%2==0 && odd%2==1)
     {
       printf("Accepted");
     }
     else
     {
       printf("Not accepted");
     }
     return 0;
}
