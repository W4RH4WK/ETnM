#include <stdio.h>

void mordor(){
	printf("One does not simply jump into mordor()!\n");
}

void echo(){
	char buffer[20];
	printf("Enter text:\n");
	scanf("%s", buffer);
	printf("You entered: %s\n", buffer);
}

int main(){

	echo();
	
	return 0;
}
