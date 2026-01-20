NAME = libft.a

CC = cc
CFLAGS = -Wall -Wextra -Werror -I.

# Directorios
SRC_DIR = src
OBJ_DIR = obj

# Archivos fuente - Solo las funciones implementadas
SRCS = ft_isalpha.c \
       ft_isdigit.c \
       ft_isalnum.c \
       ft_isascii.c \
       ft_isprint.c \
       ft_strlen.c \
       ft_memset.c \
       ft_bzero.c \
       ft_memcpy.c \
       ft_memmove.c

# Funciones pendientes por implementar:
# ft_strlcpy.c ft_strlcat.c ft_toupper.c ft_tolower.c
# ft_strchr.c ft_strrchr.c ft_strncmp.c ft_memchr.c
# ft_memcmp.c ft_strnstr.c ft_atoi.c ft_calloc.c
# ft_strdup.c ft_substr.c ft_strjoin.c ft_strtrim.c
# ft_split.c ft_itoa.c ft_strmapi.c ft_striteri.c
# ft_putchar_fd.c ft_putstr_fd.c ft_putendl_fd.c ft_putnbr_fd.c

# Archivos fuente con ruta completa
SRC_FILES = $(addprefix $(SRC_DIR)/, $(SRCS))

# Archivos objeto
OBJS = $(addprefix $(OBJ_DIR)/, $(SRCS:.c=.o))

# Archivos bonus (Parte 3 - Listas enlazadas)
BONUS_SRCS = ft_lstnew_bonus.c \
             ft_lstadd_front_bonus.c \
             ft_lstsize_bonus.c \
             ft_lstlast_bonus.c \
             ft_lstadd_back_bonus.c \
             ft_lstdelone_bonus.c \
             ft_lstclear_bonus.c \
             ft_lstiter_bonus.c \
             ft_lstmap_bonus.c

BONUS_FILES = $(addprefix $(SRC_DIR)/, $(BONUS_SRCS))
BONUS_OBJS = $(addprefix $(OBJ_DIR)/, $(BONUS_SRCS:.c=.o))

# Colores para output
GREEN = \033[0;32m
RED = \033[0;31m
NC = \033[0m

# Regla principal
all: $(NAME)

# Crear la librería
$(NAME): $(OBJ_DIR) $(OBJS)
	@ar rcs $(NAME) $(OBJS)
	@echo "$(GREEN)✓ libft.a creada exitosamente$(NC)"

# Crear directorio de objetos
$(OBJ_DIR):
	@mkdir -p $(OBJ_DIR)

# Compilar archivos objeto
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c
	@$(CC) $(CFLAGS) -c $< -o $@
	@echo "$(GREEN)Compilado: $<$(NC)"

# Regla bonus
bonus: $(OBJ_DIR) $(OBJS) $(BONUS_OBJS)
	@ar rcs $(NAME) $(OBJS) $(BONUS_OBJS)
	@echo "$(GREEN)✓ libft.a creada con bonus exitosamente$(NC)"

# Limpiar archivos objeto
clean:
	@rm -rf $(OBJ_DIR)
	@echo "$(RED)✗ Archivos objeto eliminados$(NC)"

# Limpiar todo
fclean: clean
	@rm -f $(NAME)
	@echo "$(RED)✗ libft.a eliminada$(NC)"

# Recompilar
re: fclean all

.PHONY: all clean fclean re bonus