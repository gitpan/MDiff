#include <strings.h>
#include <mdiff_functions.h>

int is_mdiff(int m, char *str1, char *str2) {
    int diff = 0;
    int i    = 0;

    while(1) {
        if(str1[i] == '\0') {
            while(str2[i++] != '\0') {
                if(++diff >= m) 
                    return 1;
            }
            return 0;
        }

        if(str2[i] == '\0') {
            while(str1[i++] != '\0') {
                if(++diff >= m) 
                    return 1;
            }
            return 0;
        }

        if(str1[i] != str2[i])
            diff++; i++;

        if(diff >= m) 
            return 1;
    }

    return 0;
}
