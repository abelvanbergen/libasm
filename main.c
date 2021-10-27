/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   main.c                                             :+:    :+:            */
/*                                                     +:+                    */
/*   By: abelfranciscusvanbergen <abelfranciscus      +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/09/09 19:36:47 by abelfrancis   #+#    #+#                 */
/*   Updated: 2020/10/13 19:57:07 by abelfrancis   ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#include "libasm.h"

#include <stdio.h>
#include <unistd.h>
#include <string.h>
#include <errno.h>
#include <fcntl.h>

void	ft_print_list(t_list *list)
{
	while(list != NULL)
	{
		printf("%s\n", list->data);
		list = list->next;
	}
}

void	test_ft_strlen(void)
{
	char str1[] = "HAllo";
	char str2[] = "Dit is even een klein testje om te kijken of mijn strlen hetzelfde doet als de echte";
	char str3[] = "dus nu even een lege string";
	char str4[] = "";
	printf("%s\nechte: %lu	neppe: %lu\n", str1, strlen(str1), ft_strlen(str1));
	printf("%s\nechte: %lu	neppe: %lu\n", str2, strlen(str2), ft_strlen(str2));
	printf("%s\nechte: %lu	neppe: %lu\n", str3, strlen(str3), ft_strlen(str3));
	printf("%s\nechte: %lu	neppe: %lu\n", str4, strlen(str4), ft_strlen(str4));
}

void	test_ft_strcpy(void)
{
	char src11[] = "Hello, World!";
	char src21[] = "even een hele lange string, ik zou niet weten wat her moeilijker aan is maar toch maar even testen";
	char dest11[14];
	char dest12[14];
	char dest21[99];
	char dest22[99];
	strcpy(dest11, src11);
	ft_strcpy(dest12, src11);
	strcpy(dest21, src21);
	ft_strcpy(dest22, src21);
	printf("%s\n", dest11);
	printf("%s\n", dest12);
	printf("%s\n", dest11);
	printf("%s	%s\n", dest11, dest12);
	printf("%s\n", dest21);
	printf("%s\n", dest22);
	printf("%s\n", dest21);
	printf("%s	%s\n", dest21, dest22);
}

void	test_ft_strcmp(void)
{
	printf("echte: %d  neppe: %d\n", strcmp("1234", "1234"), ft_strcmp("1234", "1234"));
	printf("echte: %d  neppe: %d\n", strcmp("12345", "12346"), ft_strcmp("12345", "12346"));
	printf("echte: %d  neppe: %d\n", strcmp("1234", "12345"), ft_strcmp("1234", "12345"));
	printf("echte: %d  neppe: %d\n", strcmp("12345", "1234"), ft_strcmp("12345", "1234"));
	printf("echte: %d  neppe: %d\n", strcmp("1", ""), ft_strcmp("1", ""));
	printf("echte: %d  neppe: %d\n", strcmp("", "1"), ft_strcmp("", "1ss"));
	printf("echte: %d  neppe: %d\n", strcmp("", ""), ft_strcmp("", ""));
}

void	test_ft_strdup()
{
	char *str1;
	char *str2;
	char *str3;

	str1 = ft_strdup("Hij doet het!");
	printf("%s\n", str1);
	free(str1);
	printf("-----free is gelukt!-----\n");
	str2 = ft_strdup("en nu nog steeds");
	str3 = ft_strdup("");
	printf("%s\n", str2);
	printf("|%s|\n\n", str3);
	free(str2);
	free(str3);

	system("leaks libasm");
}

void	test_ft_write()
{
	printf("neppe:\n");
	perror(NULL);
	ft_write(3, "hallo", 5);
	perror(NULL);
	errno = 0;
	ft_write(1, "hallo\n", 6);
	perror(NULL);
	ft_write(1, "hallo\n", -6);
	perror(NULL);
	ft_write(1, NULL, 6);
	perror(NULL);

	errno = 0;

	printf("\nechte:\n");
	perror(NULL);
	write(3, "hallo", 5);
	perror(NULL);
	errno = 0;
	write(1, "hallo\n", 6);
	perror(NULL);
	write(1, "hallo\n", -6);
	perror(NULL);
	write(1, NULL, 6);
	perror(NULL);
}

void	test_ft_read()
{
	int fd;
	char str[100];

	fd = open("test.txt", O_RDONLY);

	write(1, "neppe:\n", 7);
	perror(NULL);
	ft_read(4, str, 5);
	printf("%s\n", str);
	perror(NULL);
	errno = 0;
	ft_read(fd, str, 18);
	printf("%s\n", str);
	perror(NULL);
	ft_read(fd, str, -6);
	perror(NULL);
	ft_read(fd, NULL, 5);
	perror(NULL);

	errno = 0;

	write(1, "\nechte:\n", 8);
	perror(NULL);
	read(4, str, 5);
	printf("%s\n", str);
	perror(NULL);
	errno = 0;
	read(fd, str, 18);
	printf("%s\n", str);
	perror(NULL);
	read(fd, str, -6);
	perror(NULL);
	read(fd, NULL, 5);
	perror(NULL);

	close(fd);
}

void	test_ft_atoi_base()
{
	printf("+123=>				%d\n", ft_atoi_base("+123", "0123456789"));
	printf("-123=>				%d\n", ft_atoi_base("-123", "0123456789"));
	printf("+12456=>			%d\n", ft_atoi_base("+12456", "0123456789"));
	printf("123456=>			%d\n", ft_atoi_base("123456", "0123456789"));
	printf("-+12=>				%d\n", ft_atoi_base("-+12", "0123456789"));
	printf("12666=>				%d\n", ft_atoi_base("12666", "0123456789"));
	printf("2147483647=>			%d\n", ft_atoi_base("2147483647", "0123456789"));
	printf("2147483648=>			%d\n", ft_atoi_base("2147483648", "0123456789"));
	printf("-2147483648=>			%d\n", ft_atoi_base("-2147483648", "0123456789"));
	printf("-2147483649=>			%d\n", ft_atoi_base("-2147483649", "0123456789"));
	printf("1001=>				%d\n", ft_atoi_base("1001", "01"));
	printf("1001=>				%d\n", ft_atoi_base("1001", "012"));
	printf("1001=>				%d\n", ft_atoi_base("1001", "0134"));
	printf("\nAl de volgende gevallen zou moeten resultere in een 0\n");
	printf("empty=>				%d\n", ft_atoi_base("", "0134"));
	printf("emptybase=>			%d\n", ft_atoi_base("1001", ""));
	printf("base 1=>			%d\n", ft_atoi_base("1001", "1"));
	printf("tekst=>				%d\n", ft_atoi_base("tekst", "0123456789"));
	printf("base+=>				%d\n", ft_atoi_base("1001", "0123456789+"));
	printf("base-=>				%d\n", ft_atoi_base("1001", "0123456789-"));
	printf("basedubblechar=>		%d\n", ft_atoi_base("1001", "01234567890"));
}

void	test_ft_list()
{
	t_list	*new;

	new = ft_create_elem("0");
	ft_list_push_front(&new, "0");
	ft_list_push_front(&new, "1111");
	ft_list_push_front(&new, "2222");
	ft_list_push_front(&new, "2222");
	ft_print_list(new);
	printf("list size: %d\n", ft_list_size(new));
	printf("\n");
	ft_list_sort(&new, ft_strcmp);
	ft_print_list(new);
	printf("\n");
	ft_list_remove_if(&new, "0", ft_strcmp);
	ft_print_list(new);
	printf("\n");
	ft_list_remove_if(&new, "2222", ft_strcmp);
	ft_print_list(new);
	printf("\n");
	ft_list_remove_if(&new, "1111", ft_strcmp);
	printf("list size: %d\n", ft_list_size(new));
	ft_print_list(new);
	printf("\n");
	ft_list_push_front(NULL, "test");
	printf("\n");
	system("leaks libasm");
}

int main(void)
{
	printf("test strlen\n====================\n");
	test_ft_strlen();

	printf("\n\ntest strcpy\n====================\n");
	test_ft_strcpy();

	printf("\n\ntest strcmp\n====================\n");
	test_ft_strcmp();

	printf("\n\ntest strdup\n====================\n");
	test_ft_strdup();

	printf("\n\ntest write\n====================\n");
	test_ft_write();

	printf("\n\ntest read\n====================\n");
	test_ft_read();

	printf("\n\ntest atoi base\n====================\n");
	test_ft_atoi_base();

	printf("\n\ntest list\n====================\n");
	test_ft_list();
}
