#include "libft.h"

char *ft_strnstr(const char *big, const char *little, size_t len)
{
    size_t i = 0;
    size_t j;
    
    if (!*little)
        return ((char *)big);
    while (big[i] && i < len)
    {
        j = 0;
        while (big[i + j] == little[j] && (i + j) < len && little[j])
            j++;
        if (!little[j])
            return ((char *)(big + i));
        i++;
    }
    return (NULL);
}