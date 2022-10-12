// Main.c - makes LEDG0 on DE2-115 board blink if NIOS II is set up correctly
// for ECE 385 - University of Illinois - Electrical and Computer Engineering
// Author: Zuofu Cheng

//int main()
//{
//	int i = 0;
//	volatile unsigned int *LED_PIO = (unsigned int*)0x00000040; //make a pointer to access the PIO block
//
//	*LED_PIO = 0; //clear all LEDs
//	while ( (1+1) != 3) //infinite loop
//	{
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO |= 0x1; //set LSB
//		for (i = 0; i < 100000; i++); //software delay
//		*LED_PIO &= ~0x1; //clear LSB
//	}
//	return 1; //never gets here
//}


int main()
{

	volatile unsigned int *LED_PIO = (unsigned int*)0x00000040; //make a pointer to access the PIO block
	volatile unsigned int *SW_PIO = (unsigned int*)0x00000060; //make a pointer to access the PIO block
	volatile unsigned int *BTN_PIO = (unsigned int*)0x00000050; //make a pointer to access the PIO block
	int flag = 0;
	*LED_PIO = 0;

	while ((1+1) != 3)
	{
		if (*BTN_PIO == 1)
		{
			*LED_PIO = 0;
		}
		else if ((*BTN_PIO == 2) && (flag == 0))
		{
			flag = 1;
			*LED_PIO += (*SW_PIO % 256);
			if (*LED_PIO > 255)
			{
				*LED_PIO -= 256;
			}
		}
		else if (*BTN_PIO == 0)
		{
			flag = 0;
		}
	}

}
