#include <stdio.h>
#include <stdlib.h>

void printArray(int arr[], int n)
{
    for (int i = 0; i < n; ++i)
    {
        printf("%d ", arr[i]);
    }
    printf("\n");
}

int main()
{
    char string[] = "1 255 0 0 2 0 255 0 3 0 0 255 4 100 0 100 5 0 100 100 6 100 100 0 7 150 0 150 8 0 150 150 9 150 0 120";
    int colOne[4];
    int i = 0, p = 0, q = 0;
    int matrix[9][9];

    while (i < sizeof(string))
    {
        char data[5];
        int j = 0;
        while (i < sizeof(string) && string[i] != ' ')
        {
            data[j++] = string[i++];
        }
        data[j] = '\0';
        if (q >= 4)
        {
            q = 0;
            p++;
        }
        matrix[p][q] = atoi(data);
        i++;
        q++;
    }
    // for (int i = 0; i < 9; ++i)
    // {
    //     for (int j = 0; j < 4; ++j)
    //         printf("%d ", matrix[i][j]);
    //     printf("\n");
    // }
    int ledon[9], red[9], green[9], blue[9];
    for (int i = 0; i < 9; ++i)
    {
        ledon[i] = matrix[i][0];
        red[i] = matrix[i][1];
        green[i] = matrix[i][2];
        blue[i] = matrix[i][3];
    }
    printf("Ledon : ");
    printArray(ledon, 9);
    printf("Red : ");
    printArray(red, 9);
    printf("green : ");
    printArray(green, 9);
    printf("blue : ");
    printArray(blue, 9);
    return 0;
}