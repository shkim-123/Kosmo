--< ����Ŭ ���� >
--15. employee ���̺��� ��� �÷�, ��� ���� �����͸� �˻��ϸ�?
select * from employee;
--16. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date �÷��� �����͸� �˻��ϸ�?
select emp_no, emp_name, jikup, salary, hire_date from employee;
--17. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date�� �˻��ϸ鼭
--��Ī(=alias)�� �����ȣ, ������, ����, ����, �Ի��Ϸ� �ϰ� ������ '����' �̶� ���ڸ� �ٿ� �˻��ϸ�?
select emp_no as "�����ȣ", emp_name as "������", jikup as "����", salary||'����' as "����", hire_date as "�Ի���" from employee;
--18. employee ���̺��� ������, ����, ����, ����, �Ǽ��ɾ��� �˻��ϸ�? (������ ������ 12%)
select emp_name, jikup, salary, salary*0.12, salary*0.88 from employee;
--19. employee ���̺��� ������ �ߺ� ���� �˻��ϸ�?
select distinct jikup from employee;
--20. employee ���̺��� �μ���ȣ�� ������ �ߺ� ���� �˻��ϸ�?
select distinct dep_no, jikup from employee order by 1;
--21. employee ���̺��� ������ 3000 �̻��� ������ �˻��ϸ�?
select * from employee where salary >= 3000;
--22. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by salary;
--23. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by salary desc;
--24. employee ���̺��� �μ���ȣ ���������� �����ϸ鼭 ���� ������������ �˻��ϸ�?
select * from employee order by dep_no, salary desc;
--25. employee ���̺��� ������ ���� ���� �����ؼ� �˻��ϸ�?
select * from employee order by decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6);
--26. employee ���̺��� ���常 �˻��ϸ�?
select * from employee where jikup = '����';
select * from employee where jikup in('����');
--27. employee ���̺��� 20�� �μ��� ���常 �˻��ϸ�?
select * from employee where dep_no = 20 and jikup = '����';
--28. employee ���̺��� 20�� �μ� �Ǵ� ������ �˻��ϸ�?
select * from employee where dep_no = 20 or jikup='����';
--29. employee ���̺��� ���� �߿� ���� 3400 �̻��� �˻��ϸ�?
select * from employee where jikup='����' and salary >= 3400;
--30. employee ���̺��� �Ǽ��� ���� 4000���� �̻� �޴� ������ �˻��ϸ�? ��, ������ 12% ��� �����Ѵ�.
select * from employee where salary*0.88 >= 4000;
--31. employee ���̺��� ������ ���� ���� ���� ���� ������ �����ϸ鼭 �μ���ȣ�� ���������̸鼭 ������ �ƴ� ������ �˻��ϸ�?
select * from employee where jikup <> '����' order by salary desc, dep_no desc;
--32. employee ���̺��� 20�� �μ� �߿� ���� 2000 ~ 3000 ���� �˻��ϸ�?
select * from employee where dep_no = 20 and salary >= 2000 and salary <= 3000;
select * from employee where dep_no = 20 and salary between 2000 and 3000;
--33. employee ���̺��� ���� ����� ���� ������ �˻��ϸ�?
select * from employee where mgr_emp_no is null;
--34. employee ���̺��� ���� ����� �ִ� ������ �˻��ϸ�?
select * from employee where mgr_emp_no is not null;
--36. employee ���̺��� �ּ� ����, �ִ� ����, ��� ����, ��������, ���ο����� �˻��ؼ� ����ϸ�?
select min(salary), max(salary), avg(salary), sum(salary), count(*) from employee;
--37. �Ʒ� SQL ������ ���� ������ ���ΰ�?
--SELECT COUNT(emp_no) FROM customer;
-- ��� ������ �ִ� ���� ��
--
--38. ���� ����ϰ� �ִ� ������ �����?
select count(distinct emp_no) from customer;
--39. ���� ����� �ִ� ������ �����?
select count(distinct emp_no) from employee where mgr_emp_no is not null;
SELECT COUNT(mgr_emp_no) FROM employee;
--39-1. ���������� �ִ� ������ �����?
select count(distinct mgr_emp_no) from employee;
--40. employee ���̺��� ������ȣ, ������, ���Ͽ�-������ �˻��ؼ� ����ϸ�?
select emp_no, emp_name, substr(jumin_num, 3, 2)||'-'||substr(jumin_num, 5, 2) from employee;

select * from employee;
--41. customer ���̺��� ��� �÷�, ��� ���� �˻��ؼ� ����ϸ�? ��, �ֹι�ȣ�� 901225-2****** ���·� ����ϼ���.
select * from customer;
select cus_no, cus_name, tel_num, substr(jumin_num, 1, 6)||'-'||substr(jumin_num, 7, 1)||'******', emp_no from customer;
--42. customer ���̺��� ����ȣ, ����, ���������ȣ�� ����ϸ�? ��, ���������ȣ�� ������ NULL ������� ���� '����' ǥ��
select cus_no, cus_name, nvl(emp_no||'', '����') from customer;
--43. customer ���̺��� ����ȣ, ����, ����������翩�θ� ����ϸ�? ��, ������ȣ�� ������ "����", ������ "����"���� ǥ��
select cus_no, cus_name, nvl2(emp_no, '����', '����') from customer;
--44. employee ���̺��� ������ȣ, ������, ����, ������ ����ϸ�?
select emp_no, emp_name, jikup, decode(substr(jumin_num, 7, 1), '1', '��', '2', '��', '3', '��', '��') from employee;

select emp_no, emp_name, jikup, case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end from employee;
--45. employee ���̺��� ������ȣ, ������, ����, ����⵵�� ����ϸ�?
select emp_no, emp_name, jikup, case when substr(jumin_num, 7, 1) in('1', '2') then '19' else '20' end||substr(jumin_num, 1,2) from employee;
--46. employee ���̺��� ������ȣ, ������, ����, ������(4�ڸ�)�� ����ϸ�?
select emp_no, emp_name, jikup, decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 1)||'0���' from employee;
--47. employee ���̺��� ���̼����� ����ϸ�?
select * from employee order by case substr(jumin_num, 7, 1) when '1' then '19' when '2' then '19' else '20' end||substr(jumin_num, 1, 6);
--48. employee ���̺��� ���� ������� �����Ͽ� ��� �÷��� ���̸�?
select * from employee order by decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6);
--49. employee ���̺��� ������ȣ, ������, �Ի���(��-��-��(����) �б� �ú���) �˻��ϸ�?
select emp_no, emp_name, to_char(hire_date, 'yyyy-mm-dd(dy) q hh:mi:ss', 'nls_date_language=korean') from employee;
--49-1. employee ���̺��� ������ȣ, ������, �Ի���(x��-x��-x��(����) x�б� x��x��x��) �˻��ϸ�?
select emp_no, emp_name, to_char(hire_date, 'yyyy"��"-mm"��"-dd"��"(dy) q"�б�" hh"��"mi"��"ss"��"', 'nls_date_language=korean') from employee;
--50. employee ���̺��� ������ȣ, ������, ���� �˻��ϸ�?
select emp_no, emp_name, to_number(to_char(sysdate, 'yyyy')) - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) +1
from employee;
--51. employee ���̺��� ������ȣ, ������, �ٹ������� �˻��ؼ� ����ϸ�?
select emp_no, emp_name, ceil((sysdate - hire_date)/365) from employee;
--52. employee ���̺��� ������ȣ, ������, ���ɴ븦 �˻��ؼ� ����ϸ�?
select emp_no, emp_name, floor((decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)+1)*0.1)||'0��'
from employee;

-- 210801
--53. employee ���̺��� ������ȣ, ������, 100�� ��ġ ��¥(��-��-��)�� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , to_char(to_date(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 6), 'yyyymmdd')+100, 'yyyy-mm-dd')
from employee;
--53-1. �������� 2021�� 5�� 12���̰� �������� 2021�� 11�� 10�� �̴�. ��ĥ ���� �п� ��Ȱ�� �ϳ�?
select to_date('20211110', 'yyyymmdd') - to_date('20210512', 'yyyymmdd') from dual;
--54. employee ���̺��� ������ȣ, ������, ���糪��, �Ի��� ��� ���̸� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , extract(year from sysdate) - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) + 1  as "���糪��"
    , extract(year from hire_date) - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) + 1 as "�Ի��� ��� ����"
from employee;
--55. employee ���̺��� ������ȣ, ������, �ֹι�ȣ, �ٰ��û��ϳ�(��-��-��), ���ϱ��� �����ϼ��� �˻��ϸ�?
select emp_no, emp_name, jumin_num
    , to_char(to_date(case
            when to_number(substr(jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) > 0 then to_char(sysdate, 'yyyy')
            else to_char(sysdate+365, 'yyyy')
            end||substr(jumin_num, 3, 4), 'yyyymmdd'), 'yyyy-mm-dd')  as "�ٰ��û��ϳ�"
    , ceil(to_date(case
            when to_number(substr(jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) > 0 then to_char(sysdate, 'yyyy')
            else to_char(sysdate+365, 'yyyy')
            end||substr(jumin_num, 3, 4), 'yyyymmdd') - sysdate) as "���ϱ��� �����ϼ�"
from employee;
--56. employee ���̺��� ������ȣ, ������, ����, ����(xxx,xxx,xxx����)�� �˻��ϸ�?
select emp_no, emp_name, jikup, to_char(salary, '999,999,999')||'����' as "����"
from employee;
--57. employee ���̺��� �����Ͽ� �¾ ������ �˻��϶�
select *
from employee
where to_char(
    to_date(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 6), 'yyyymmdd')
    , 'dy', 'nls_date_language=korean') = '��';
--58. employee ���̺��� 70���� ���� ������ �˻��϶�
select *
from employee
where substr(jumin_num, 1, 1) = '7' and substr(jumin_num, 7, 1) = '1'
--59. employee ���̺��� 1960���, 1970��� ����� �� ���ڸ� �˻��϶�
select *
from employee
where substr(jumin_num, 1, 1) in('6', '7') and substr(jumin_num, 7, 1) = '1'
--60. employee ���̺��� ���� �ٹ��� ������ ���� ������ �˻��ϸ�?
select * from employee order by hire_date
--
--61. ������ȣ, ������, �ٹ��ϼ�, �ٹ�������, �Ի��� 5���� �� ��¥(��-��-��),
--�Ի��� ���� ������ ��¥(��-��-��), �Ի��� ��¥ ���� ���ƿ��� �Ͽ��ϳ�¥(��-��-��)�� �˻��ϸ�?
--��, �ٹ��ϼ��� �Ҽ� 2�ڸ����� �ݿø�
select emp_no, emp_name, round(sysdate - hire_date, 1) as "�ٹ��ϼ�", months_between(sysdate, hire_date) as "�ٹ�������"
        , to_char(add_months(hire_date, 5), 'yyyy-mm-dd') as "�Ի���5����"
        , to_char(last_day(hire_date), 'yyyy-mm-dd') as "�Ի��Ѵ��Ǹ�������¥", to_char(next_day(hire_date, 1), 'yyyy-mm-dd day') as "�Ի��� ��¥ �Ͽ���"
from employee;
--
--62. employee ���̺��� ������ ������ ������ �˻��ϸ�?
select * from employee where jikup = '����'
--63. employee ���̺��� ������ ������ �ƴ� ������ �˻��ϸ�?
select * from employee where jikup <> '����'
--64. employee ���̺��� �μ���ȣ�� 10���̰� ������ ������ ������ �˻��ϸ�?
select * from employee where dep_no = 10 and jikup = '����'
--65. employee ���̺��� ������ ���� �Ǵ� ������ ������ �˻��ϸ�?
select * from employee where jikup in('����', '����')
select * from employee where jikup = any('����', '����')
--66. employee ���̺��� 10��, 20�� �μ� �߿� ������ ������ ������ �˻��ϸ�?
select * from employee where dep_no in(10, 20) and jikup = '����'
--67. customer ���̺��� ��������� ���� ���� �˻��ϸ�?
select * from customer where emp_no is null
--68. customer ���̺��� ��������� �ִ� ���� �˻��ϸ�?
select * from customer where emp_no is not null
--69. customer ���̺��� ������� ��ȣ�� 9���� �ƴ� ���� �˻��ϸ�?
select * from customer where emp_no <> 9 or emp_no is null
--70. employee ���̺��� ������ 3000 ���� ~ 4000���� ������ ������ �˻��ϸ�?
select * from employee where salary between 3000 and 4000
--71. employee ���̺��� ������ 3000���� �̻� ~ 4000���� �̸� ������ ������ �˻��ϸ�?
select * from employee where (salary between 3000 and 4000) and salary <> 4000
--72. employee ���̺��� ������ 5% �λ�ƴٰ� �����ϰ� 3000�̻��� ������ �˻��ϸ�
select * from employee where salary*1.05 >= 3000
--73. employee ���̺��� �Ի��� �� '1995-1-1' �̻��� ������ �˻��ϸ�?
select * from employee where hire_date >= to_date('1995-1-1', 'yyyy-mm-dd')
--74. employee ���̺��� �Ի����� 1990�� ~ 1999�� ������ ������ �˻��ϸ�?
select * from employee where hire_date between to_date('19900101', 'yyyymmdd') and to_date('19991231', 'yyyymmdd')
--75. employee ���̺��� �μ���ȣ�� 10�� �Ǵ� 30���� ���� �߿� ������ 3000 �̸��̰� �Ի����� '1996-01-01' �̸� ������ �˻��ϸ�?
select * from employee where dep_no in(10, 30) and salary < 3000 and hire_date < to_date('1996-01-01', 'yyyy-mm-dd')
--76. employ ���̺��� ���� �达�� ������ �˻��ϸ�?
select * from employee where emp_name like '��%'
--77. employ ���̺��� ���� Ȳ���� ������ �˻��ϸ�?
select * from employee where emp_name like 'Ȳ%' and emp_name not like 'Ȳ��%'
--78. employee ���̺��� �̸��� 2���� ������ �˻��ϸ�?
select * from employee where length(emp_name) = 2
--79. employee ���̺��� �̸��� ������ ������ ������ �˻��ϸ�?
select * from employee where emp_name like '%��'
--80. employee ���̺��� ���� �达�̰� 3������ ������ �˻��ϸ�?
select * from employee where emp_name like '��%' and length(emp_name) = 3
select * from employee where emp_name like '��__'
--81. employee ���̺��� �̸��� ���̶� ���ڸ� ���� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%'
--82. employee ���̺��� ���� �达�� �ƴ� ������ �˻��ϸ�?
select * from employee where emp_name not like '��%'
--83. employee ���̺��� �̸� �߰����� ���� �� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%' and emp_name not like '��%' and emp_name not like '%��'
--84. employee ���̺��� ���� ������ �˻��϶�
select * from employee where substr(jumin_num, 7, 1) in('2', '4')
--85. employee ���̺��� 1960���, 1970��� ������� ���ڸ� �˻��϶�
select * from employee where (jumin_num like '6%' or jumin_num like '7%') and substr(jumin_num, 7, 1) = '1'
select * from employee where jumin_num like '6_____1%' or jumin_num like '7_____1%'
--86. ������ȣ, ������, �ҼӺμ��� �˻�?
select e.emp_no, e.emp_name, d.dep_name from employee e, dept d where e.dep_no = d.dep_no
--87. ����ȣ, ����, ����������̸� �˻��ϸ�?
select c.cus_no, c.cus_name, e.emp_name from customer c, employee e where c.emp_no = e.emp_no
--88. ��� �������� ���� �޴� ������ �˻��ϸ�?
select * from employee where salary > (select avg(salary) from employee)
--89. ���޺�, ��տ��� �˻��ϸ�?
select jikup, avg(salary) from employee group by jikup
--
--90. ������ȣ, ������, �ҼӺμ��� �˻�?
select e.emp_no, e.emp_name, d.dep_name from employee e, dept d where e.dep_no = d.dep_no
select e.emp_no, e.emp_name, d.dep_name from employee e inner join dept d on e.dep_no = d.dep_no
--91. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c, employee e where c.emp_no = e.emp_no
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c inner join employee e on c.emp_no = e.emp_no
--92. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> 10�� �μ��� ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c, employee e where c.emp_no = e.emp_no and e.dep_no = 10
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c inner join employee e on c.emp_no = e.emp_no where e.dep_no = 10
--93. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ������ 3000���� �̻��� ��������� �ִ� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c, employee e where c.emp_no = e.emp_no and salary >= 3000
select c.cus_name, c.tel_num, e.emp_name, e.jikup from customer c inner join employee e on c.emp_no = e.emp_no where salary >= 3000
--94. ������, ��������, �����μ���, ������, ����ȭ�� ����ϸ�? <����> ���� �̸� �������� ����
select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num from employee e, dept d, customer c where e.dep_no = d.dep_no and e.emp_no = c.emp_no
order by e.emp_name;
select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e inner join dept d on e.dep_no = d.dep_no
                inner join customer c on e.emp_no = c.emp_no
order by e.emp_name;
--95. ������, ��������, �ҼӺμ���, ��������� ����ϸ�? ������� ��������, ���޳������� ��������, ���̳������� ���� ���� ���
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e, dept d, salary_grade s
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(e.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 6);
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e inner join dept d  on e.dep_no = d.dep_no
                inner join salary_grade s on e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(e.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 6);

-- 21/08/02 ��
--96. ����������, ������������, ���ӻ����, ���ӻ�������� ����ϸ�? <����> ����� �ִ� ������ ����
select e1.emp_name, e1.jikup, e2.emp_name, e2.jikup
from employee e1, employee e2
where e1.mgr_emp_no = e2.emp_no;
select e1.emp_name, e1.jikup, e2.emp_name, e2.jikup
from employee e1 inner join employee e2 on e1.mgr_emp_no = e2.emp_no;
--97. ���ӻ����, ���ӻ������, ����������, �������������� ����ϸ�? <����> ����� �ִ� ������ ����
select e1.emp_name, e1.jikup, e2.emp_name, e2.jikup
from employee e1, employee e2
where e1.emp_no = e2.mgr_emp_no;

select e1.emp_name, e1.jikup, e2.emp_name, e2.jikup
from employee e1 inner join employee e2 on e1.emp_no = e2.mgr_emp_no;
--98. ������, ��������, �ҼӺμ���, �������, ���ӻ����, ���ӻ������, �������� ����ϸ�?
select e1.emp_name, e1.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e1, dept d, salary_grade s, employee e2, customer c
where e1.dep_no = d.dep_no and e1.salary between s.min_salary and s.max_salary and e1.mgr_emp_no = e2.emp_no and e1.emp_no = c.emp_no;

select e1.emp_name, e1.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e1 inner join dept d on e1.dep_no = d.dep_no
                 inner join salary_grade s on e1.salary between s.min_salary and s.max_salary
                 inner join employee e2 on e1.mgr_emp_no = e2.emp_no
                 inner join customer c on e1.emp_no = c.emp_no;
--99. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� ���� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+);

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no;
--100. ����ȣ, ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> �������� ��� ���̰� ���������� 10�� �μ��� ���� ��
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+) and e.dep_no(+) = 10

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no and e.dep_no = 10

-- 21.08.03
--101. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, ���������������� ����ϸ�? <����> ��������� ���� ���� ����
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, s.sal_grade_no
from customer c, employee e, salary_grade s
where c.emp_no = e.emp_no(+) and e.salary between s.min_salary(+) and s.max_salary(+)

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, s.sal_grade_no
from customer c left outer join employee e on c.emp_no = e.emp_no
                left outer join salary_grade s on e.salary between s.min_salary and s.max_salary
--102. ����ȣ, ����, ���ֹι�ȣ�� ����϶�. ��, ������ 3000 �̻��� ��������� ����� �� �̾�� �Ѵ�.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000

select c.cus_no, c.cus_name, c.jumin_num
from customer c inner join employee e on c.emp_no = e.emp_no and e.salary >= 3000
--103. ����ȣ, ����, ���ֹι�ȣ�� ����϶�. ��, 40�� �̻��� ��������� ����� �� �̾�� �Ѵ�.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and
    extract(year from sysdate) - to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 2)) + 1 >= 40

select c.cus_no, c.cus_name, c.jumin_num
from customer c inner join employee e on c.emp_no = e.emp_no
                and extract(year from sysdate) - to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 2)) + 1 >= 40
--103-1. 10�� �μ� �Ǵ� 30�� �μ� ������ ����ϴ� ���� �˻��ϸ�?
select c.cus_no, c.cus_name, c.tel_num, c.jumin_num, c.emp_no
from customer c, employee e
where c.emp_no = e.emp_no and e.dep_no in(10, 30)

select c.cus_no, c.cus_name, c.tel_num, c.jumin_num, c.emp_no
from customer c inner join employee e on c.emp_no = e.emp_no and e.dep_no in(10, 30)
--
--104. ����ȣ, ����,
--���������ȣ,���������, ��������ҼӺμ���, ��������������, ����������ӻ����, ����������ӻ������,
--���ӻ��������� ����϶�. ��, ���� �� ���;� �ϰ� NULL�� �������� ǥ��
select c.cus_no, c.cus_name, nvl(e1.emp_no||'', '����'), nvl(e1.emp_name||'', '����'), nvl(d.dep_name||'', '����')
        , nvl(s1.sal_grade_no||'', '����'), nvl(e2.emp_name||'', '����'), nvl(e2.jikup||'', '����'), nvl(s2.sal_grade_no||'', '����')
from customer c, employee e1, dept d, salary_grade s1, employee e2, salary_grade s2
where c.emp_no = e1.emp_no(+) and e1.dep_no = d.dep_no(+) and (e1.salary between s1.min_salary(+) and s1.max_salary(+))
    and e1.mgr_emp_no = e2.emp_no(+) and (e2.salary between s2.min_salary(+) and s2.max_salary(+))
order by 1

select c.cus_no, c.cus_name, nvl(e1.emp_no||'', '����'), nvl(e1.emp_name||'', '����'), nvl(d.dep_name||'', '����')
        , nvl(s1.sal_grade_no||'', '����'), nvl(e2.emp_name||'', '����'), nvl(e2.jikup||'', '����'), nvl(s2.sal_grade_no||'', '����')
from customer c left outer join employee e1 on c.emp_no = e1.emp_no
                left outer join dept d on e1.dep_no = d.dep_no
                left outer join salary_grade s1 on e1.salary between s1.min_salary and s1.max_salary
                left outer join employee e2 on e1.mgr_emp_no = e2.emp_no
                left outer join salary_grade s2 on e2.salary between s2.min_salary and s2.max_salary
order by 1
--
--
--105. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����� �� ��
select emp_name, phone
from employee
union
select cus_name, tel_num
from customer
--106. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����
select emp_name, phone
from employee
union all
select cus_name, tel_num
from customer

--108. �ְ� ������ �޴� ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee)
--109. ��� ���� �̻��� �޴� ������ �˻��϶�
select * from employee where salary >= (select avg(salary) from employee)
--110. 20�� �μ����� �ְ� ������ ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee where dep_no = 20) and dep_no = 20
--
--111. ������, ����, ����, ��ü�������� �����ϴ� ������ �˻��϶�. ��, ��ü�������� �����ϴ� ������ �Ҽ��� �����ϰ� %�� ǥ���϶�.
--��, ���� ������ ���� ������ �����϶�.
select emp_name, jikup, salary, floor(salary/(select sum(salary) from employee)*100)||'%'
from employee
order by 4 desc;
--
--112. 10�� �μ� �������� �����ϴ� ����ȣ, ����, ������ȣ�� �˻��ϸ�?
select cus_no, cus_name, emp_no
from customer
where emp_no = any(select emp_no from employee where dep_no =10)

select c.cus_no, c.cus_name, c.emp_no
from customer c, employee e
where c.emp_no = e.emp_no and e.dep_no = 10

select cus_no, cus_name, emp_no
from customer c
where (select dep_no from employee e where e.emp_no = c.emp_no) = 10

select cus_no, cus_name, emp_no from customer c where exists(select * from employee e where e.emp_no = c.emp_no and e.dep_no = 10)
--113. ��� ���� �̻��̰� �ִ� ���� �̸��� ������, ����, ��ü��տ���, ��ü�ִ뿬���� ����ϸ�?
select emp_name, salary, (select avg(salary) from employee), (select max(salary) from employee)
from employee
where salary >= (select avg(salary) from employee) and salary < (select max(salary) from employee)

--114. �ְ� ���� ������ ������ȣ, ������, �μ���, ������ �˻��ϸ�?
select e.emp_no, e.emp_name, (select dep_name from dept d where d.dep_no = e.dep_no), e.salary
from employee e
where salary = (select max(salary) from employee)

select e.emp_no, e.emp_name, d.dep_name, e.salary
from employee e, dept d
where e.dep_no = d.dep_no and salary = (select max(salary) from employee)
--115. ��� ���� 2�� �̻��� ������ȣ, ������, ������ �˻��ϸ�?
select emp_no, emp_name, jikup
from employee e
where 2 <= (select count(*) from customer c where e.emp_no = c.emp_no)
--116. ������ȣ, ������, �ҼӺμ����� �˻��ϸ�?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no

select e.emp_no, e.emp_name, (select d.dep_name from dept d where d.dep_no = e.dep_no)
from employee e

--117. ������ȣ, ������, ����, ���� ������ ����ϸ�? ��, ���� ������ �������� ����
select emp_no, emp_name, salary, (select count(*) + 1 from employee e2 where e1.salary < e2.salary)
from employee e1
order by 4
--118. ������ȣ, ������, �������� ����ϸ�?
select emp_no, emp_name, (select count(*) from customer c where c.emp_no = e.emp_no)
from employee e
--119. �μ���, �μ�������, �μ��������� ����ϸ�?
select dep_name
    , (select count(*) from employee e where e.dep_no = d.dep_no)
    , (select count(*) from employee e, customer c where e.dep_no = d.dep_no and e.emp_no = c.emp_no)
from dept d
--

-- 21.08.05.��
--120. ������ȣ, ������, ����, �ֹι�ȣ, ���޼��������� ����ϸ�?
--��, ������ ������ ���� ���� ������ ���޼������� �̴�. �׸��� ���޼��������� �������� ����
select emp_no, emp_name, jikup, jumin_num
    , (select count(*)+1 from employee e2
            where
                case
                    when e1.jikup <> e2.jikup
                    then decode(e1.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
                end > decode(e2.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
                or
                case
                    when e1.jikup = e2.jikup
                    then decode(substr(e1.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e1.jumin_num, 1, 6)
                end > decode(substr(e2.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e2.jumin_num, 1, 6)
    )
    as "���޼�������"
from employee e1
order by 5
--

-- 21.08.06.��
--121. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����> ��������� ���� ���� ����. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select c.cus_no, c.cus_name, c.tel_num
    , (select e.emp_name from employee e where e.emp_no = c.emp_no)
    , (select e.jikup from employee e where e.emp_no = c.emp_no)
    , (select e.dep_no from employee e where e.emp_no = c.emp_no)
from customer c

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, e.dep_no
from customer c, employee e
where c.emp_no = e.emp_no(+)

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, e.dep_no
from customer c left outer join employee e on c.emp_no = e.emp_no
--
--122. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����>�������� ��� ���̰� ���������� 10�� �μ��� ���� ��. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select cus_no, cus_name, tel_num
    , (select e.emp_name from employee e where e.emp_no = c.emp_no and e.dep_no = 10)
    , (select e.jikup from employee e where e.emp_no = c.emp_no and e.dep_no = 10)
    , (select dep_no from employee e where e.emp_no = c.emp_no and e.dep_no = 10)
from customer c

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, e.dep_no
from customer c, employee e
where c.emp_no = e.emp_no(+) and e.dep_no(+) = 10

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, e.dep_no
from customer c left outer join employee e on c.emp_no = e.emp_no and e.dep_no = 10
--
--124. �μ����� �μ���ȣ, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select d.dep_no, sum(salary), round(avg(salary), 1), count(*)
from dept d, employee e
group by d.dep_no
--125. ���޺��� ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select jikup, sum(salary), round(avg(salary), 1), count(*)
from employee
group by jikup
--126. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select dep_no, jikup, sum(salary), round(avg(salary), 1), count(*)
from employee
group by dep_no, jikup
--127. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϵ� �ο����� 3�� �̻��� ����ϸ�?
select dep_no, jikup, sum(salary), round(avg(salary), 1), count(*)
from employee
group by dep_no, jikup
having count(*) >= 3

select * from (
    select dep_no, jikup, sum(salary) "TOT_SALARY", round(avg(salary), 1) "AVG_SALARY", count(*) "EMP_CNT"
    from employee
    group by dep_no, jikup)
where EMP_CNT >=3
--128. �μ���, ������ �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�?
select dep_no, decode(substr(jumin_num, 7, 1), '1', '����', '3', '����', '����'), sum(salary), round(avg(salary), 1), count(*)
from employee
group by  dep_no, decode(substr(jumin_num, 7, 1), '1', '����', '3', '����', '����')
--129. �Ի�⵵���� �Ի�⵵, �ο����� ����ϰ� �⵵���� �������� �ϸ�?
select extract(year from hire_date), count(*)
from employee
group by extract(year from hire_date)
order by 1
--130. �μ����� �μ���ȣ, ��ձٹ������ ����ϸ�? (�ٳ���� �Ҽ��� ��° �ڸ����� �ݿø��� ��)
select dep_no, round(avg((sysdate - hire_date)/365), 1)
from employee
group by dep_no

-- 21.08.07 ��
--131. �Ի�б⺰�� �Ի�б�, �ο����� ����ϸ�?
select to_char(hire_date, 'q')||'�б�', count(*)
from employee
group by to_char(hire_date, 'q')

--132. �Ի翬�뺰, ������ �Ի翬��, ����, ���뺰�Ի��ڼ� ����ϸ�?
select substr(extract(year from hire_date), 1, 3)||'0���', decode(substr(jumin_num, 7, 1), '1', '����', '3', '����', '����'), count(*)
from employee
group by substr(extract(year from hire_date), 1, 3)||'0���', decode(substr(jumin_num, 7, 1), '1', '����', '3', '����', '����')
--
--133. ������, �Ի���(��-��-�� ~/4�б� �ѱ� 1�ڸ� ����), ������(��-��-��) ����ϸ�?
--<����> �������� �Ի� �� 20�� 5���� 10�� ��
select emp_name, to_char(hire_date, 'yyyy-mm-dd q"/4�б�" dy', 'nls_date_language=korean')
    , to_char(add_months(hire_date+10, 5) + 20*365, 'yyyy-mm-dd')
from employee
--
--134. �������� �ִ� �μ����� �μ���ȣ, �μ���ġ, �������� ����ϸ�? ��� �μ� �� ���Ͷ�
select d.dep_no, d.loc, count(emp_no)
from dept d, employee e
where d.dep_no = e.dep_no(+)
group by d.dep_no, d.loc

select d.dep_no, d.loc, count(emp_no)
from dept d left outer join employee e on d.dep_no = e.dep_no
group by d.dep_no, d.loc

select d.dep_no, d.loc, (select count(*) from employee e where e.dep_no = d.dep_no)
from dept d
--
--135. ������ �Ի��, �ο����� �˻��ϸ�? �Ի�� �������� ���� <����> �Ի�� �������� ����
--<����> �� ������� 2��, 9���� ��� ������. 2��, 9���� ���Խ�Ű�� �ο����� 0���� �����Ϸ���?
select extract(month from hire_date), count(*)
from employee
group by extract(month from hire_date)
order by 1

select m.month, count(e.emp_name)
from ( select '01' "MONTH" from dual union
        select '02' from dual union select '03' from dual union select '04' from dual union
        select '05' from dual union select '06' from dual union select '07' from dual union
        select '08' from dual union select '09' from dual union select '10' from dual union
        select '11' from dual union select '12' from dual ) m, employee e
where to_char(e.hire_date(+), 'mm') = m.month
group by m.month
order by 1

select m.month, (select count(e.emp_name) from employee e where to_char(e.hire_date, 'mm') = m.month )
from  ( select '01' "MONTH" from dual union
        select '02' from dual union select '03' from dual union select '04' from dual union
        select '05' from dual union select '06' from dual union select '07' from dual union
        select '08' from dual union select '09' from dual union select '10' from dual union
        select '11' from dual union select '12' from dual ) m
order by 1
--
--136. employee ���̺��� ���޼������ �����Ͽ� ���޺��� ����, ������տ���, �ο����� �˻��ϸ�? (���� ������ ���� ���;���)
select jikup, round(avg(salary), 1), count(*)
from employee
group by jikup
order by decode(jikup, '����', 1, '����', 2, '����', 3, '�븮' ,4, '����', 5, 6)
--137. �μ��� �μ���ȣ, �μ���, ������, �����̰����ϴ°����� �˻��ϸ�?
select d.dep_no, d.dep_name, count(distinct e.emp_no), count(c.cus_no)
from dept d, employee e, customer c
where d.dep_no = e.dep_no(+) and e.emp_no = c.emp_no(+)
group by d.dep_no, d.dep_name

select d.dep_no, d.dep_name, count(distinct e.emp_no), count(c.cus_no)
from dept d left outer join employee e on d.dep_no = e.dep_no
            left outer join customer c on e.emp_no = c.emp_no
group by d.dep_no, d.dep_name

select d.dep_no, d.dep_name
    , (select count(e.emp_no) from employee e where d.dep_no = e.dep_no)
    , (select count(c.cus_no) from customer c, employee e where c.emp_no =e.emp_no and e.dep_no = d.dep_no)
from dept d
--
--138. �������� 60����� ���� �Ͽ� �Ʒ�ó�� ����ϸ�?
--������ȣ, ������, �ٹ�����, �����ϱ��� ���� �⵵, ����(��-��-�� ���ϸ�), �ҼӺμ���, ���ӻ����, ���ӻ�� �μ���.
--��, ��� ���� �� ������, ���� ���� ����� ���� ������ ������ ������ ���̰� ���� ����� ���;���.
select e.emp_no, e.emp_name, ceil((sysdate - e.hire_date)/365)  as "�ٹ�����"
    , -- �����ϱ��� ���� �⵵, 60 - ���糪��
    60 - (extract(year from sysdate) - to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 2)) + 1)
    as "�������������⵵"
   , -- ����, �ֹι�ȣ�� ���� - ���� ���� > 0, ����, < 0 ������
   to_char(to_date(case
        when to_number(substr(e.jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) > 0  then extract(year from sysdate)
        else extract(year from sysdate) + 1
   end||substr(e.jumin_num, 3, 4), 'yyyymmdd'), 'yyyy-mm-dd day', 'nls_date_language=korean')
   as "����"
   , d.dep_name
   , e2.emp_name
   , d2.dep_name
from employee e, dept d, employee e2, dept d2
where e.dep_no = d.dep_no(+) and e.mgr_emp_no = e2.emp_no(+) and e2.dep_no = d2.dep_no(+)
order by decode(e.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 6)

select e.emp_no, e.emp_name, ceil((sysdate - e.hire_date)/365)  as "�ٹ�����"
    , -- �����ϱ��� ���� �⵵, 60 - ���糪��
    60 - (extract(year from sysdate) - to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 2)) + 1)
    as "�������������⵵"
   , -- ����, �ֹι�ȣ�� ���� - ���� ���� > 0, ����, < 0 ������
   to_char(to_date(case
        when to_number(substr(e.jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) > 0  then extract(year from sysdate)
        else extract(year from sysdate) + 1
   end||substr(e.jumin_num, 3, 4), 'yyyymmdd'), 'yyyy-mm-dd day', 'nls_date_language=korean')
   as "����"
   , d.dep_name
   , e2.emp_name
   , d2.dep_name
from employee e left outer join dept d on e.dep_no = d.dep_no
                left outer join employee e2 on e.mgr_emp_no = e2.emp_no
                left outer join dept d2 on e2.dep_no = d2.dep_no
order by decode(e.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 6)

select e.emp_no, e.emp_name, ceil((sysdate - e.hire_date)/365)  as "�ٹ�����"
    , -- �����ϱ��� ���� �⵵, 60 - ���糪��
    60 - (extract(year from sysdate) - to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 2)) + 1)
    as "�������������⵵"
   , -- ����, �ֹι�ȣ�� ���� - ���� ���� > 0, ����, < 0 ������
   to_char(to_date(case
        when to_number(substr(e.jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) > 0  then extract(year from sysdate)
        else extract(year from sysdate) + 1
   end||substr(e.jumin_num, 3, 4), 'yyyymmdd'), 'yyyy-mm-dd day', 'nls_date_language=korean')
   as "����"
   , (select dep_name from dept d where d.dep_no = e.dep_no)
   , (select e2.emp_name from employee e2 where e.mgr_emp_no = e2.emp_no)
   , (select dep_name from dept d, employee e2 where d.dep_no = e2.dep_no and e.mgr_emp_no = e2.emp_no)
from employee e
order by decode(e.jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num, 1, 6)
--
--140. ���� ������� ������ �˻��ϵ� 1����� 10������� �˻��ϸ�?
select *
from (
    select rownum "RNUM", e.*
    from (select * from employee order by salary) e
    where rownum <= 10
) zxc
where zxc.rnum >= 1
--
--140-6. �� ���� ������ 6����� 10����� �˻��ϸ�?
select * from (
  select rownum "RNUM", c.*
  from (
      select * from customer c order by decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')
  ) c where rownum <= 10
) zxc where zxc.rnum >= 6
--
--140-7. ���� ���� ���� �� 2����� 5����� �˻��ϸ�?
select * from (
    select rownum "RNUM", zxc.*
    from  (select * from employee order by decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)) zxc
    where rownum <= 5
) where rnum >= 2
--
--141. ���ú��� 10�� ���ı��� ��¥ �߿� �����, �Ͽ���, �������� ������ ���� ������ ���ϸ�?
select * from (
    select sysdate "XDAY" from dual union select sysdate+1 from dual union select sysdate+2 from dual
    union select sysdate+3 from dual union select sysdate+4 from dual union select sysdate+5 from dual
    union select sysdate+6 from dual union select sysdate+7 from dual union select sysdate+8 from dual
    union select sysdate+9 from dual union select sysdate+10 from dual
) zxc where to_char(zxc.xday, 'dy', 'nls_date_language=korean') not in('��', '��', '��')
--
--142. �̹��� �߿� �����, �Ͽ����� ������ ���� ������ ���ϸ�? = �̹��� ���� �� ���ϱ�
select count(*) from (
    SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD') "XDAY" FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+1 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+2 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+3 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+4 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+5 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+6 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+7 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+8 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+9 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+10 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+11 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+12 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+13 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+14 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+15 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+16 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+17 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+18 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+19 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+20 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+21 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+22 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+23 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+24 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+25 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+26 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+27 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+28 FROM DUAL
    UNION SELECT TO_DATE(TO_CHAR(SYSDATE, 'YYYYMM')||'01', 'YYYYMMDD')+29 FROM DUAL
) d where to_char(d.xday, 'dy', 'nls_date_language=korean') not in('��', '��')
--
--146. employee ���̺�κ��� salary �÷��� �����ϰ� �� �� �� �ִ� �� employee_vw1�� �����ϸ�?
create view employee_vw1 as
select emp_no, emp_name, dep_no, jikup, hire_date, jumin_num, phone, mgr_emp_no
from employee

select * from employee_vw1
drop view employee_vw1
--
--147. �� employee_vw1�� ������ '�̽¿�', 40, '����', '1990-09-01', '7811231452719', '01090056376', 1 �� �Է��ϸ�?
insert into employee_vw1(emp_no, emp_name, dep_no, jikup, hire_date, jumin_num, phone, mgr_emp_no)
values((select nvl(max(emp_no), 0)+1 from employee), '�̽¿�', 40, '����', to_date('1990-09-01', 'yyyy-mm-dd'), '7811231452719', '01090056376', 1)

rollback;
--
--148. �� employee_vw1���� �ֹι�ȣ '7811231452719', ������ '�̽¿�'�� ������ �������� �����ϸ�?
update employee_vw1 set jikup = '����' where jumin_num = '7811231452719' and emp_name ='�̽¿�'

select * from employee_vw1
--
--149. �� employee_vw1���� �ֹι�ȣ '7811231452719' �� ������ �����ϸ�?
delete from employee_vw1 where jumin_num = '7811231452719'
--
--150. �� employee_vw1 �� �����ϸ�?
drop view employee_vw1
--
--150-1. �μ���, ���޺� �μ���ȣ, �μ���, ����, ��տ����� ����ϴ� �� employee_vw3�� �����ϸ�?
create view employee_vw3 as
select d.dep_no, d.dep_name, e.jikup, round(avg(e.salary), 1)  "AVG_SALARY"
from dept d, employee e
where d.dep_no = e.dep_no
group by d.dep_no, d.dep_name, e.jikup

select * from employee_vw3
--
--151. ���� �信 ���� ������ ����ϸ�?
--CREATE VIEW employee_vw4 AS
--SELECT emp_no, emp_name, dep_no FROM employee;
--���� �並 ���� �� INSERT INTO employee_vw4 VALUES(21, '�����', 40);
--�����ϸ� �����ϳ� �����ϳ�?
-- ����
--
--152. ���� �信 ���� ������ ����ϸ�?
--INSERT INTO dept VALUES(60, '������', '�λ�');
--CREATE VIEW dept_vw1 AS
--SELECT dep_no, dep_name, loc FROM dept
--WHERE dep_no = 60 WITH CHECK OPTION;
--����!!
--UPDATE dept_vw1 SET dep_no = 70 WHERE dep_no = 60; �� �����ϸ�?
-- ����, with check option �� �־ where ���� ���� �� ����
select view_name, text from employee_vw3
--
--156. employee ���̺� '�庸��', 40, '�븮', 3500, '2012-05-28', '8311091109310', '01092499215', 3 �����͸� �Է��ϸ�?
insert into employee(emp_no, emp_name, dep_no, jikup, salary, hire_date, jumin_num, phone, mgr_emp_no)
values((select nvl(max(emp_no), 0)+1 from employee), '�庸��', 40, '�븮', 3500, to_date('2012-05-28', 'yyyy-mm-dd'), '8311091109310', '01092499215', 3)

rollback
select * from employee
--
--157. employee ���̺��� ���� ��ȣ�� 18�� �̰�, �ֹι�ȣ '8203121977315'�� '������' ������ ������ '����'���� �����Ϸ���?
update employee set jikup = '����' where emp_no = 18
--
--158. ���� ������ ������ 500���� �λ��ϴ� UPDATE ����?
update employee set salary = salary + 500 where substr(jumin_num, 7, 1) in('2', '4')
--
--159. employee ���̺��� ��� ���� �̻��� ���� ������ 2% �谨�ϸ�?
update employee set salary = salary*0.98 where salary >= (select avg(salary) from employee )
--
--160. employee ���̺��� ��� ���� ���� ���� �������� ������ 50���� �λ��ϸ�?
update employee set salary = salary + 50 where salary < (select avg(salary) from employee)
--
--161. ��� ���� �ִ� ������ �޿��� 5% �λ��ϸ�?
update employee set salary = salary*1.05 where emp_no = any(select emp_no from customer where emp_no is not null)
--
--162. ���� ���� 2~5������ 5���� ������ 10% �����ϸ�?
--���� ���� �� �������� ���� > ���� ���� ���� > �Ի��� ���� ���� > ���� ���� ����
update employee set salary = salary*0.9
where emp_no = any(
    select * from (
    select rownum "RNUM", zxc.*
    from
    (select * from employee order by salary desc, decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6), hire_date
        , decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 6)) zxc
    where rownum <= 5 ) where rnum >= 2
)
select * from employee
--
--163. employee�� �Ȱ��� ������ �Ȱ��� �����͸� ���� �ֵ��� ���̺� employee2 �����?
create table employee2 as select * from employee
--
--164. employee�� �Ȱ��� ������ ���� �ֵ��� ���̺� employee3�� ����� �����ʹ� ������ ���� ��������?
create table employee3 as select * from employee where 2=1
--
--
--