/* ************************************************************************** */
/*                                                                            */
/*                                                        ::::::::            */
/*   libasm.h                                           :+:    :+:            */
/*                                                     +:+                    */
/*   By: avan-ber <avan-ber@student.codam.nl>         +#+                     */
/*                                                   +#+                      */
/*   Created: 2020/09/22 14:31:43 by avan-ber      #+#    #+#                 */
/*   Updated: 2020/10/12 17:29:52 by abelfrancis   ########   odam.nl         */
/*                                                                            */
/* ************************************************************************** */

#ifndef	LIBASM_H
# define LIBASM_H

#include <stdlib.h>
#include <sys/types.h>

/*
** Libasm structs --------------------------------------------------------------
*/

/*
** Libasm struct list
*/
typedef struct		s_list
{
	void			*data;
	struct s_list	*next;
}					t_list;

/*
**==============================================================================
*/



/*
** Libasm prototypes -----------------------------------------------------------
*/

/*
** Libasm Mandatory
*/
size_t	ft_strlen(const char *s);
char	*ft_strcpy(char *dest, const char *src);
int		ft_strcmp(const char *s1, const char *s2);
char	*ft_strdup(const char *s1);
ssize_t	ft_write(int fd, const void *buf, size_t count);
ssize_t ft_read(int fd, void *buf, size_t count);

/*
** Libasm Bonus
*/

/*
** Libasm Bonus ft_atoi_base + utils
*/
int		ft_count(char *str, char c);
int		ft_strchr_l(char *str, char c);
int		ft_atoi_base(char *str, char *base);

/*
** Libasm Bonus List + utils
*/
t_list	*ft_create_elem(void *data);
void	ft_list_push_front(t_list **begin_list, void *data);
int		ft_list_size(t_list *begin_list);
void	ft_list_sort(t_list **begin_list, int (*cmp)());
void	ft_list_remove_if(t_list **begin_list, void *data_ref, int (*cmp)());

/*
**==============================================================================
*/

#endif
