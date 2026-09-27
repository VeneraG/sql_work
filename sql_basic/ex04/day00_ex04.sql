select name || ' (age:' || age || ',gender:''' || gender || ''',address:''' || address || ''')' as person_information       
from person p 
order by person_information ;
