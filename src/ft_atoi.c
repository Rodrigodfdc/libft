#include "libft.h"

int ft_atoi(const char *nptr)
{
    int sign = 1;
    int result = 0;
    
    // Saltar espacios
    while (*nptr == ' ' || (*nptr >= 9 && *nptr <= 13))
        nptr++;
    
    // Manejar signo
    if (*nptr == '-' || *nptr == '+')
    {
        if (*nptr == '-')
            sign = -1;
        nptr++;
    }
    
    // Convertir dígitos
    while (*nptr >= '0' && *nptr <= '9')
    {
        result = result * 10 + (*nptr - '0');
        nptr++;
    }
    
    return (result * sign);
}