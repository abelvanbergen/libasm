# **************************************************************************** #
#                                                                              #
#                                                         ::::::::             #
#    Makefile                                           :+:    :+:             #
#                                                      +:+                     #
#    By: abelfranciscusvanbergen <abelfranciscus      +#+                      #
#                                                    +#+                       #
#    Created: 2020/09/10 10:09:19 by abelfrancis   #+#    #+#                  #
#    Updated: 2020/10/13 19:51:37 by abelfrancis   ########   odam.nl          #
#                                                                              #
# **************************************************************************** #

NAME = libasm.a
C_FLAGS = -Wall -Wextra -Werror
L_FLAGS = -f macho64

OBJECTS =	ft_strlen.o \
			ft_strcpy.o \
			ft_strcmp.o \
			ft_strdup.o \
			ft_write.o \
			ft_read.o
BONUS = 	ft_strchr_l.o \
			ft_count.o \
			ft_atoi_base.o \
			ft_create_elem.o \
			ft_list_push_front.o \
			ft_list_size.o \
			ft_list_sort.o \
			ft_list_remove_if.o
LBLUE =  \033[38;5;14m
BLUE =  \033[38;5;12m
RED =  \033[38;5;9m
YELLOW =  \033[38;5;11m
WHITE =  \033[38;5;7m


all: $(NAME)

%.o: %.s
	@echo "$(LBLUE)Compiling...		$(BLUE)$<"
	@nasm -o $@ $< $(L_FLAGS)

$(NAME): $(OBJECTS)
	@echo "\n$(LBLUE)making				$(BLUE)$(NAME)"
	@ar rcs $(NAME) $(OBJECTS)
	@echo "$(RED)========================================"
	@echo "$(RED)||                DONE                ||"
	@echo "$(RED)========================================"

bonus: $(OBJECTS) $(BONUS)
	@echo "$(LBLUE)\nAdding bonus to		$(BLUE)$(NAME)"
	@ar rcs $(NAME) $(OBJECTS) $(BONUS)
	@echo "$(RED)========================================"
	@echo "$(RED)||                DONE                ||"
	@echo "$(RED)========================================"

clean:
	@echo "\n$(LBLUE)removing 		$(BLUE)objects"
	@/bin/rm -f $(OBJECTS)
	@/bin/rm -f $(BONUS)
	@echo "$(RED)========================================"
	@echo "$(RED)||                DONE                ||"
	@echo "$(RED)========================================"

fclean: clean
	@echo "\n$(LBLUE)removing 		$(BLUE)$(NAME)"
	@/bin/rm -f 					$(NAME)
	@echo "$(RED)========================================"
	@echo "$(RED)||                DONE                ||"
	@echo "$(RED)========================================\n"

re: fclean all

test:re bonus
	@echo "\n$(LBLUE)making executable		$(BLUE)libasm"
	@gcc $(C_FLAGS) main.c $(NAME) -o libasm
	@echo "$(RED)========================================"
	@echo "$(RED)||                DONE                ||"
	@echo "$(RED)========================================"

.PHONY: all clean fclean re
