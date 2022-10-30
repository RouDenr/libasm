# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: decordel <decordel@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2022/10/30 05:36:42 by decordel          #+#    #+#              #
#    Updated: 2022/10/30 05:41:25 by decordel         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

EXT		= .out
RM		= rm -rf

NAME		= 	libasm
NAME_EXT	= 	${NAME}${EXT}

SRCS	=	main.cpp

OBJS	= ${SRCS:%.cpp=%.o}
DEP		= ${OBJS:%.o=%.d}


all: ${ASM}
	echo Hello asm

-include ${DEP}

#!--DEBUG

ARGS	= test 5 7

run		:	${NAME_EXT}
	@echo
	@./$^ ${ARGS}

# debug	:	${NAME_EXT}
# 	@lldb -- ./$^$ ${ARGS}

leaks	:	${NAME_EXT}
	@leaks --atExit -- ./$^  ${ARGS}

#!--DEBUG


# ! SYSTEM TOOLS
ASM		= ~/goinfre/.brew/bin/nasm
BREW	= ~/goinfre/.brew

${BREW}	:
	sh ../../scripts/install_brew_goinfree.sh
	exit 0

${ASM}	: ${BREW}
	brew install nasm
	exit 0
# ! SYSTEM TOOLS

clean	:
	${RM} ${OBJS} ${DEP}

fclean	: clean
	${RM} ${NAME_EXT}

re		: fclean all

.PHONY : all clean fclean re run
