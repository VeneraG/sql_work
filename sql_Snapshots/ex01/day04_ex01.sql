SELECT v_persons_female.name as name FROM v_persons_female 
union all 
SELECT v_persons_male.name FROM v_persons_male
ORDER BY name ;

