int a,b,cc,dd,e,ff,x,y;
int value;
int value2;
double ans;
double ans2;
double ans3;
int ans4;
void main() {

trisb=0;
trisc=0;
trisd=15;
portb=0;
portc=0;
portd=0;

ff:
while(1)
{
   if(Button(&PORTC,5,10,1))
   {
      if(Button(&PORTD,0,10,1))
      {
         value+=1;
      }
      if(Button(&PORTD,1,10,1))
      {
         value+=2;
      }
      if(Button(&PORTD,2,10,1))
      {
         value+=4;
      }
      if(Button(&PORTD,3,10,1))
      {
         value+=8;
      }
      for(;;)
      {
         if(Button(&PORTC,5,10,0))
         {
            break;
         }
      }
      PORTB = dec2bcd(value);
   
      for(;;)
      {
         if((Button(&PORTD,4,10,1))||(Button(&PORTD,5,10,1))||(Button(&PORTD,6,10,1))||(Button(&PORTD,7,10,1)))
         {
            if((Button(&PORTD,4,10,1)))
            {
               y = 1;
               portc = y;
               goto a;
            }
            if((Button(&PORTD,5,10,1)))
            {
               y = 2;
               portc = y;
               goto b;
            }
            if((Button(&PORTD,6,10,1)))
            {
               y = 3;
               portc = y;
               goto cc;
            }
            if((Button(&PORTD,7,10,1)))
            {
               y = 4;
               portc = y;
               goto dd;
            }
         }
      }
      
      // ADD
      a:
      for(;;)
      {
         if(Button(&PORTC,5,10,1))
         {
            if(Button(&PORTD,0,10,1))
            {
               value2+=1;
            }
            if(Button(&PORTD,1,10,1))
            {
               value2+=2;
            }
            if(Button(&PORTD,2,10,1))
            {
               value2+=4;
            }
            if(Button(&PORTD,3,10,1))
            {
               value2+=8;
            }
            for(;;)
            {
               if(Button(&PORTC,5,10,0))
               {
                  break;
               }
            }
            PORTB = dec2bcd(value2);
            for(;;)
            {
               if(Button(&PORTC,6,10,1))
               {
                  portb = dec2bcd(value + value2);
                  goto e;
               }
            }
         }
      }
      
      //SUBTRACT
      b:
      for(;;)
      {
         if(Button(&PORTC,5,10,1))
         {
            if(Button(&PORTD,0,10,1))
            {
               value2+=1;
            }
            if(Button(&PORTD,1,10,1))
            {
               value2+=2;
            }
            if(Button(&PORTD,2,10,1))
            {
               value2+=4;
            }
            if(Button(&PORTD,3,10,1))
            {
               value2+=8;
            }
            for(;;)
            {
               if(Button(&PORTC,5,10,0))
               {
                  break;
               }
            }
            PORTB = dec2bcd(value2);
            for(;;)
            {
               if(Button(&PORTC,6,10,1))
               {
                  portb = dec2bcd(abs(value - value2));
                  goto e;
               }
            }
         }
      }
      
      //MULTIPLY
      cc:
      for(;;)
      {
         if(Button(&PORTC,5,10,1))
         {
            if(Button(&PORTD,0,10,1))
            {
               value2+=1;
            }
            if(Button(&PORTD,1,10,1))
            {
               value2+=2;
            }
            if(Button(&PORTD,2,10,1))
            {
               value2+=4;
            }
            if(Button(&PORTD,3,10,1))
            {
               value2+=8;
            }
            for(;;)
            {
               if(Button(&PORTC,5,10,0))
               {
                  break;
               }
            }
            PORTB = dec2bcd(value2);
            for(;;)
            {
               if(Button(&PORTC,6,10,1))
               {
                  portb = dec2bcd((value * value2)% 100);
                  goto e;
               }
            }
         }
      }
      
      //DIVIDE
      dd:
      for(;;)
      {
         if(Button(&PORTC,5,10,1))
         {
            if(Button(&PORTD,0,10,1))
            {
               value2+=1;
            }
            if(Button(&PORTD,1,10,1))
            {
               value2+=2;
            }
            if(Button(&PORTD,2,10,1))
            {
               value2+=4;
            }
            if(Button(&PORTD,3,10,1))
            {
               value2+=8;
            }
            for(;;)
            {
               if(Button(&PORTC,5,10,0))
               {
                  break;
               }
            }
            PORTB = dec2bcd(value2);
            for(;;)
            {
               if(Button(&PORTC,6,10,1))
               {
                  ans = value * 1.00;
                  ans2 = value2 * 1.00;
                  ans3 = ans / ans2;
                  portb = dec2bcd(ans3);
                  delay_ms(1000);
                  ans4 = (int)(ans3 * 100) % 100;
                  if(ans4 > 0)
                  {
                     portb = dec2bcd(ans4);
                  }
                  goto e;
               }
            }
         }
      }
      
      //RESET
      e:
      for(;;)
      {
         if(Button(&PORTC,7,10,1))
         {
            portb = 0;
            portc = 0;
            value = 0;
            value2 = 0;
            goto ff;
         }
      }
   }
}
}