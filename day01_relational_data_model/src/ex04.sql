-- Anna (age:16,gender:'female',address:'Moscow')
select CONCAT(name, ' (age:', age, ',gender:''', gender, ''',address:''' , address, ''')') as person_information
from person
order by person_information asc