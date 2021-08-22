--< ����Ŭ ���� >

-- 2021.08.21
--15. employee ���̺��� ��� �÷�, ��� ���� �����͸� �˻��ϸ�?
select * from employee
--16. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date �÷��� �����͸� �˻��ϸ�?
select emp_no, emp_name, jikup, salary, hire_date from employee
--17. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date�� �˻��ϸ鼭
--��Ī(=alias)�� �����ȣ, ������, ����, ����, �Ի��Ϸ� �ϰ� ������ '����' �̶� ���ڸ� �ٿ� �˻��ϸ�?
select emp_no "�����ȣ", emp_name "������", jikup "����", salary||'����' "����", hire_date "�Ի���"
from employee
--18. employee ���̺��� ������, ����, ����, ����, �Ǽ��ɾ��� �˻��ϸ�? (������ ������ 12%)
select emp_name, jikup, salary, salary*0.12, salary*0.88 from employee
--19. employee ���̺��� ������ �ߺ� ���� �˻��ϸ�?
select distinct jikup from employee
select unique jikup from employee
--20. employee ���̺��� �μ���ȣ�� ������ �ߺ� ���� �˻��ϸ�?
select distinct dep_no, jikup from employee
--21. employee ���̺��� ������ 3000 �̻��� ������ �˻��ϸ�?
select * from employee where salary >= 3000
--22. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by  salary
--23. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by salary desc
--24. employee ���̺��� �μ���ȣ ���������� �����ϸ鼭 ���� ������������ �˻��ϸ�?
select * from employee order by dep_no, salary desc
--25. employee ���̺��� ������ ���� ���� �����ؼ� �˻��ϸ�?
select * from employee order by decode(jikup, '����', 1, '����', 2,' ����', 3, '�븮', 4, '����', 5, 6)
--26. employee ���̺��� ���常 �˻��ϸ�?
select * from employee where jikup='����'
--27. employee ���̺��� 20�� �μ��� ���常 �˻��ϸ�?
select * from employee where dep_no=20 and jikup='����'
--28. employee ���̺��� 20�� �μ� �Ǵ� ������ �˻��ϸ�?
select * from employee where dep_no=20 or jikup='����'
--29. employee ���̺��� ���� �߿� ���� 3400 �̻��� �˻��ϸ�?
select * from employee where jikup = '����' and salary >= 3400
--30. employee ���̺��� �Ǽ��� ���� 4000���� �̻� �޴� ������ �˻��ϸ�? ��, ������ 12% ��� �����Ѵ�.
select * from employee where salary*0.88 >= 4000
--31. employee ���̺��� ������ ���� ���� ���� ���� ������ �����ϸ鼭 �μ���ȣ�� ���������̸鼭 ������ �ƴ� ������ �˻��ϸ�?
select * from employee where jikup <> '����' order by salary*0.12 desc, dep_no desc
--32. employee ���̺��� 20�� �μ� �߿� ���� 2000 ~ 3000 ���� �˻��ϸ�?
select * from employee where dep_no=20 and salary between 2000 and 3000
--33. employee ���̺��� ���� ����� ���� ������ �˻��ϸ�?
select * from employee where mgr_emp_no is null
--34. employee ���̺��� ���� ����� �ִ� ������ �˻��ϸ�?
select * from employee where mgr_emp_no is not null
--36. employee ���̺��� �ּ� ����, �ִ� ����, ��� ����, ��������, ���ο����� �˻��ؼ� ����ϸ�?
select min(salary), max(salary), avg(salary), sum(salary), count(*) from employee
--37. �Ʒ� SQL ������ ���� ������ ���ΰ�?
--SELECT COUNT(emp_no) FROM customer;
-- ��� ������ �ִ� �� ��
--
--38. ���� ����ϰ� �ִ� ������ �����?
select count(distinct emp_no) from customer
--39. ���� ����� �ִ� ������ �����?
select count(mgr_emp_no) from employee
--39-1. ���������� �ִ� ������ �����?
select count(distinct mgr_emp_no) from employee
--40. employee ���̺��� ������ȣ, ������, ���Ͽ�-������ �˻��ؼ� ����ϸ�?
select emp_no, emp_name, substr(jumin_num, 3, 2)||'-'||substr(jumin_num, 5, 2) from employee
--41. customer ���̺��� ��� �÷�, ��� ���� �˻��ؼ� ����ϸ�? ��, �ֹι�ȣ�� 901225-2****** ���·� ����ϼ���.
select cus_no, cus_name, tel_num, substr(jumin_num, 1, 6)||'-'||substr(jumin_num, 7, 1)||'******' from customer
--42. customer ���̺��� ����ȣ, ����, ���������ȣ�� ����ϸ�? ��, ���������ȣ�� ������ NULL ������� ���� '����' ǥ��
select cus_no, cus_name, nvl(emp_no||'', '����') from customer
--43. customer ���̺��� ����ȣ, ����, ����������翩�θ� ����ϸ�? ��, ������ȣ�� ������ "����", ������ "����"���� ǥ��
select cus_no, cus_name, nvl2(emp_no, '����', '����') from customer
--44. employee ���̺��� ������ȣ, ������, ����, ������ ����ϸ�?
select emp_no, emp_name, jikup, case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end from employee
--45. employee ���̺��� ������ȣ, ������, ����, ����⵵�� ����ϸ�?
select emp_no, emp_name, jikup, decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)
from employee
--46. employee ���̺��� ������ȣ, ������, ����, ������(4�ڸ�)�� ����ϸ�?
select emp_no, emp_name, jikup, decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 1)||'0���'
from employee
--47. employee ���̺��� ���̼����� ����ϸ�?
select * from employee order by decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 6)
--48. employee ���̺��� ���� ������� �����Ͽ� ��� �÷��� ���̸�?
select * from employee order by decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
--49. employee ���̺��� ������ȣ, ������, �Ի���(��-��-��(����) �б� �ú���) �˻��ϸ�?
select emp_no, emp_name, to_char(hire_date, 'yyyy-mm-dd(day) q"�б�" am hh:mi:ss', 'nls_date_language=korean')
from employee
--49-1. employee ���̺��� ������ȣ, ������, �Ի���(x��-x��-x��(����) x�б� x��x��x��) �˻��ϸ�?
select emp_no, emp_name, to_char(hire_date, 'yyyy-mm-dd(dy) q"�б�" hh"��"mi"��"ss"��"', 'nls_date_language=korean')
from employee
--50. employee ���̺��� ������ȣ, ������, ���� �˻��ϸ�?
select emp_no, emp_name
    , extract(year from sysdate)
        - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) +1   "����"
from employee
--51. employee ���̺��� ������ȣ, ������, �ٹ������� �˻��ؼ� ����ϸ�?
select emp_no, emp_name, ceil((sysdate-hire_date)/365) "�ٹ�����" from employee
--52. employee ���̺��� ������ȣ, ������, ���ɴ븦 �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , floor((extract(year from sysdate)
    - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) +1)*0.1)||'0��' "���ɴ�"
from employee
--53. employee ���̺��� ������ȣ, ������, 100�� ��ġ ��¥(��-��-��)�� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , to_char(to_date(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')
        ||substr(jumin_num, 1, 6), 'yyyymmdd')+100, 'yyyy-mm-dd') "100����ġ"
from employee
--53-1. �������� 2021�� 5�� 12���̰� �������� 2021�� 11�� 10�� �̴�. ��ĥ ���� �п� ��Ȱ�� �ϳ�?
select to_date('20211110', 'yyyymmdd') - to_date('20210821', 'yyyymmdd')  from dual
--54. employee ���̺��� ������ȣ, ������, ���糪��, �Ի��� ��� ���̸� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , extract(year from sysdate)
     - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) + 1  "���糪��"
    , extract(year from hire_date)
     - to_number(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 2)) + 1 "�Ի糪��"
from employee
--55. employee ���̺��� ������ȣ, ������, �ֹι�ȣ, �ٰ��û��ϳ�(��-��-��), ���ϱ��� �����ϼ��� �˻��ϸ�?
select emp_no, emp_name, jumin_num
    , --���� - ���� >  0 ����, �ƴϸ� ����
    to_char(to_date(case when to_number(substr(jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else  extract(year from sysdate) + 1
    end||substr(jumin_num, 3, 4), 'yyyymmdd'), 'yyyy-mm-dd')   "�ٰ��û���"
    , ceil(to_date(case when to_number(substr(jumin_num, 3, 4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else  extract(year from sysdate) + 1
    end||substr(jumin_num, 3, 4), 'yyyymmdd') - sysdate)   "�����ϼ�"
from employee
--56. employee ���̺��� ������ȣ, ������, ����, ����(xxx,xxx,xxx����)�� �˻��ϸ�?
select emp_no, emp_name, jikup, to_char(salary, '999,999,999')||'����' "����" from employee
--57. employee ���̺��� �����Ͽ� �¾ ������ �˻��϶�
select * from employee
where to_char(to_date(decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')
        ||substr(jumin_num, 1, 6), 'yyyymmdd'), 'day', 'nls_date_language=korean') = '������'
--58. employee ���̺��� 70���� ���� ������ �˻��϶�
select * from employee where substr(jumin_num, 1, 1) = '7' and substr(jumin_num, 7, 1) ='1'
--59. employee ���̺��� 1960���, 1970��� ����� �� ���ڸ� �˻��϶�
select * from employee where substr(jumin_num, 1, 1) in('6', '7') and substr(jumin_num ,7, 1) = '1'
--60. employee ���̺��� ���� �ٹ��� ������ ���� ������ �˻��ϸ�?
select * from employee order by sysdate-hire_date desc
--
--61. ������ȣ, ������, �ٹ��ϼ�, �ٹ�������, �Ի��� 5���� �� ��¥(��-��-��),
--�Ի��� ���� ������ ��¥(��-��-��), �Ի��� ��¥ ���� ���ƿ��� �Ͽ��ϳ�¥(��-��-��)�� �˻��ϸ�?
--��, �ٹ��ϼ��� �Ҽ� 2�ڸ����� �ݿø�
select emp_no, emp_name
    , round(sysdate-hire_date, 1) "�ٹ��ϼ�"
    , round(months_between(sysdate, hire_date), 1) "�ٹ�������"
    , to_char(add_months(hire_date, 5), 'yyyy-mm-dd') "�Ի���5������"
    , to_char(last_day(hire_date), 'yyyy-mm-dd')   "�Ի��Ѵ��Ǹ�������¥"
    , to_char(next_day(hire_date, 1), 'yyyy-mm-dd')  "�Ի�����Ͽ���"
from employee
--
--62. employee ���̺��� ������ ������ ������ �˻��ϸ�?
select * from employee where jikup = '����'
--63. employee ���̺��� ������ ������ �ƴ� ������ �˻��ϸ�?
select * from employee where jikup <> '����'
--64. employee ���̺��� �μ���ȣ�� 10���̰� ������ ������ ������ �˻��ϸ�?
select * from employee where dep_no = 10 and jikup='����'
--65. employee ���̺��� ������ ���� �Ǵ� ������ ������ �˻��ϸ�?
select * from employee where jikup in('����', '����')
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
select * from employee where salary between 3000 and 4000 and salary <> 4000
--72. employee ���̺��� ������ 5% �λ�ƴٰ� �����ϰ� 3000�̻��� ������ �˻��ϸ�
select * from employee where salary*1.05 >= 3000
--73. employee ���̺��� �Ի��� �� '1995-1-1' �̻��� ������ �˻��ϸ�?
select * from employee where hire_date >= to_date('19950101', 'yyyymmdd')
--74. employee ���̺��� �Ի����� 1990�� ~ 1999�� ������ ������ �˻��ϸ�?
select * from employee where hire_date between to_date('19900101', 'yyyymmdd') and to_date('19991231', 'yyyymmdd')
--75. employee ���̺��� �μ���ȣ�� 10�� �Ǵ� 30���� ���� �߿� ������ 3000 �̸��̰� �Ի����� '1996-01-01' �̸� ������ �˻��ϸ�?
select * from employee where dep_no in(10, 30) and salary < 3000 and hire_date < to_date('19960101', 'yyyymmdd')
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
--81. employee ���̺��� �̸��� ���̶� ���ڸ� ���� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%'
--82. employee ���̺��� ���� �达�� �ƴ� ������ �˻��ϸ�?
select * from employee where emp_name not like '��%'
--83. employee ���̺��� �̸� �߰����� ���� �� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%' and emp_name not like '��%' and emp_name not like '%��'
--84. employee ���̺��� ���� ������ �˻��϶�
select * from employee where substr(jumin_num, 7, 1) in('2', '4')
--85. employee ���̺��� 1960���, 1970��� ������� ���ڸ� �˻��϶�
select * from employee where jumin_num like '6_____1%' or jumin_num like '7_____1%'
--86. ������ȣ, ������, �ҼӺμ��� �˻�?
select emp_no, emp_name, dep_name from employee e, dept d where e.dep_no = d.dep_no
--87. ����ȣ, ����, ����������̸� �˻��ϸ�?
select cus_no, cus_name, emp_name from customer c, employee e where c.emp_no = e.emp_no
--88. ��� �������� ���� �޴� ������ �˻��ϸ�?
select * from employee where salary > (select avg(salary) from employee)
--89. ���޺�, ��տ��� �˻��ϸ�?
select jikup, avg(salary)
from employee group by jikup
--
--90. ������ȣ, ������, �ҼӺμ��� �˻�?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no
--91. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no
--92. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> 10�� �μ��� ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.dep_no = 10
--93. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ������ 3000���� �̻��� ��������� �ִ� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000
--94. ������, ��������, �����μ���, ������, ����ȭ�� ����ϸ�? <����> ���� �̸� �������� ����
select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e, dept d, customer c
where e.dep_no = d.dep_no and e.emp_no = c.emp_no
order by 1
--95. ������, ��������, �ҼӺμ���, ��������� ����ϸ�? ������� ��������, ���޳������� ��������, ���̳������� ���� ���� ���
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e, dept d, salary_grade s
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
order by 4, decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6)
        , decode(substr(jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(jumin_num, 1, 6)
--96. ����������, ������������, ���ӻ����, ���ӻ�������� ����ϸ�? <����> ����� �ִ� ������ ����
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.mgr_emp_no = e2.emp_no
--97. ���ӻ����, ���ӻ������, ����������, �������������� ����ϸ�? <����> ����� �ִ� ������ ����
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.emp_no = e2.mgr_emp_no
--98. ������, ��������, �ҼӺμ���, �������, ���ӻ����, ���ӻ������, �������� ����ϸ�?
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e, dept d, salary_grade s, employee e2, customer c
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary and e.mgr_emp_no = e2.emp_no and e.emp_no = c.emp_no
--99. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� ���� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+)
--100. ����ȣ, ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> �������� ��� ���̰� ���������� 10�� �μ��� ���� ��
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+) and e.dep_no(+) = 10
--101. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, ���������������� ����ϸ�? <����> ��������� ���� ���� ����
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup, s.sal_grade_no
from customer c, employee e, salary_grade s
where c.emp_no = e.emp_no(+) and e.salary between s.min_salary(+) and s.max_salary(+)
--102. ����ȣ, ����, ���ֹι�ȣ�� ����϶�. ��, ������ 3000 �̻��� ��������� ����� �� �̾�� �Ѵ�.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000
--103. ����ȣ, ����, ���ֹι�ȣ�� ����϶�. ��, 40�� �̻��� ��������� ����� �� �̾�� �Ѵ�.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no
    and (extract(year from sysdate) -
        to_number(decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num,1,2)) + 1) >= 40
--103-1. 10�� �μ� �Ǵ� 30�� �μ� ������ ����ϴ� ���� �˻��ϸ�?
select *
from employee e, customer c
where e.emp_no = c.emp_no and e.dep_no in(10, 30)
--
--104. ����ȣ, ����,
--���������ȣ,���������, ��������ҼӺμ���, ��������������, ����������ӻ����, ����������ӻ������,
--���ӻ��������� ����϶�. ��, ���� �� ���;� �ϰ� NULL�� �������� ǥ��
select c.cus_no, c.cus_name, nvl(e.emp_no||'', '����'), nvl(e.emp_name||'', '����'), nvl(d.dep_name||'', '����')
    , nvl(s.sal_grade_no||'', '����'), nvl(e2.emp_name||'', '����'), nvl(e2.jikup||'', '����'), nvl(s2.sal_grade_no||'', '����')
from customer c, employee e, dept d, salary_grade s, employee e2, salary_grade s2
where c.emp_no = e.emp_no(+) and e.dep_no = d.dep_no(+) and e.salary between s.min_salary(+) and s.max_salary(+) and
        e.mgr_emp_no = e2.emp_no(+) and e2.salary between s2.min_salary(+) and s2.max_salary(+)
--
--

-- 21.08.22
--105. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����� �� ��
select emp_name||'����' "�̸�", phone from employee
union
select cus_name||'��', tel_num from customer
--106. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����
select emp_name||'����' "�̸�", phone from employee
union all
select cus_name||'��', tel_num from customer
--108. �ְ� ������ �޴� ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee)
--109. ��� ���� �̻��� �޴� ������ �˻��϶�
select * from employee where salary >= (select avg(salary) from employee)
--110. 20�� �μ����� �ְ� ������ ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee where dep_no=20) and dep_no = 20
--
--111. ������, ����, ����, ��ü�������� �����ϴ� ������ �˻��϶�. ��, ��ü�������� �����ϴ� ������ �Ҽ��� �����ϰ� %�� ǥ���϶�.
--��, ���� ������ ���� ������ �����϶�.
select emp_name, jikup, salary, floor((salary/(select sum(salary) from employee))*100)||'%' "����"
from employee
order by (salary/(select sum(salary) from employee))*100 desc
--
--112. 10�� �μ� �������� �����ϴ� ����ȣ, ����, ������ȣ�� �˻��ϸ�?
select cus_no, cus_name, emp_no
from customer
where emp_no in(select emp_no from employee where dep_no=10)
--113. ��� ���� �̻��̰� �ִ� ���� �̸��� ������, ����, ��ü��տ���, ��ü�ִ뿬���� ����ϸ�?
select emp_name, salary, (select avg(salary) from employee), (select max(salary) from employee)
from employee
where salary >= (select avg(salary) from employee) and salary < (select max(salary) from employee)
--114. �ְ� ���� ������ ������ȣ, ������, �μ���, ������ �˻��ϸ�?
select emp_no, emp_name, (select dep_name from dept d where d.dep_no = e.dep_no) "�μ���", salary
from employee e
where salary = (select max(salary) from employee)
--115. ��� ���� 2�� �̻��� ������ȣ, ������, ������ �˻��ϸ�?
select emp_no, emp_name, jikup
from employee e
where 2 <= (select count(c.emp_no) from customer c where c.emp_no = e.emp_no)
--116. ������ȣ, ������, �ҼӺμ����� �˻��ϸ�?
select emp_no, emp_name, (select dep_name from dept d where e.dep_no = d.dep_no) "�ҼӺμ���"
from employee e
--117. ������ȣ, ������, ����, ���� ������ ����ϸ�? ��, ���� ������ �������� ����
select emp_no, emp_name, salary, (select count(*)+1 from employee e2 where e2.salary > e.salary)  "��������"
from employee e
order by 4
--118. ������ȣ, ������, �������� ����ϸ�?
select emp_no, emp_name, (select count(emp_no) from customer c where c.emp_no = e.emp_no) "������"
from employee e
--119. �μ���, �μ�������, �μ��������� ����ϸ�?
select d.dep_name
    , (select count(*) from employee e where e.dep_no = d.dep_no)  "�μ�������"
    , (select count(*) from employee e, customer c where e.dep_no = d.dep_no and c.emp_no = e.emp_no) "�μ�������"
from dept d
--
--120. ������ȣ, ������, ����, �ֹι�ȣ, ���޼��������� ����ϸ�?
--��, ������ ������ ���� ���� ������ ���޼������� �̴�. �׸��� ���޼��������� �������� ����
select emp_no, emp_name, jikup, jumin_num
    , (select count(*)+1 from employee e2
            where (e2.jikup <> e.jikup and
                decode(e2.jikup, '����',1,'����',2,'����',3,'�븮',4,'����',5,6)
                < decode(e.jikup, '����',1,'����',2,'����',3,'�븮',4,'����',5,6))
                or e2.jikup = e.jikup and
                decode(substr(e2.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e2.jumin_num,1, 6)
                < decode(substr(e.jumin_num, 7, 1), '1', '19', '2', '19', '20')||substr(e.jumin_num,1, 6)   )  "���޼�������"
from employee e
order by 5
--
--121. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����> ��������� ���� ���� ����. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select cus_no, cus_name, tel_num
        , (select emp_name from employee e where e.emp_no=c.emp_no)  "���������"
        , (select jikup from employee e where e.emp_no = c.emp_no)  "�����������"
        , (select dep_no from employee e where e.emp_no = c.emp_no)  "�μ���ȣ"
from customer c
--
--122. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����>�������� ��� ���̰� ���������� 10�� �μ��� ���� ��. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select cus_no, cus_name, tel_num
    , (select emp_name from employee e where e.emp_no=c.emp_no and e.dep_no=10) "���������"
    , (select jikup from employee e where e.emp_no=c.emp_no and e.dep_no=10) "�����������"
    , (select dep_no from employee e where e.emp_no=c.emp_no and e.dep_no=10) "�μ���ȣ"
from customer c
--
--124. �μ����� �μ���ȣ, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select dep_no, sum(salary), round(avg(salary), 1), count(*) from employee group by dep_no
--125. ���޺��� ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select jikup, sum(salary), round(avg(salary), 1), count(*) from employee group by jikup
--126. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select dep_no, jikup, sum(salary), round(avg(salary), 1), count(*) from employee group by dep_no, jikup
--127. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϵ� �ο����� 3�� �̻��� ����ϸ�?
select dep_no, jikup, sum(salary), round(avg(salary),1), count(*)
from employee
group by dep_no, jikup
having count(*) >= 3
--128. �μ���, ������ �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�?
select dep_no, case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end "����", sum(salary), avg(salary), count(*)
from employee
group by dep_no, case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end
--129. �Ի�⵵���� �Ի�⵵, �ο����� ����ϰ� �⵵���� �������� �ϸ�?
select extract(year from hire_date), count(*)
from employee
group by extract(year from hire_date)
order by 1
--130. �μ����� �μ���ȣ, ��ձٹ������ ����ϸ�? (�ٳ���� �Ҽ��� ��° �ڸ����� �ݿø��� ��)
select dep_no, round(avg((sysdate-hire_date)/365), 1) "��ձٹ����"
from employee
group by dep_no
--131. �Ի�б⺰�� �Ի�б�, �ο����� ����ϸ�?
select to_char(hire_date, 'q')||'�б�', count(*)||'��' "�ο���"
from employee
group by to_char(hire_date, 'q')||'�б�'
--132. �Ի翬�뺰, ������ �Ի翬��, ����, ���뺰�Ի��ڼ� ����ϸ�?
select substr(extract(year from hire_date), 1, 3)||'0���' "���"
    , case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end "����"
    , count(*)||'��' "�Ի��ڼ�"
from employee
group by substr(extract(year from hire_date), 1, 3)||'0���', case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end
--
--133. ������, �Ի���(��-��-�� ~/4�б� �ѱ� 1�ڸ� ����), ������(��-��-��) ����ϸ�?
--<����> �������� �Ի� �� 20�� 5���� 10�� ��
select emp_name, to_char(hire_date, 'yyyy-mm-dd q"/�б�" dy', 'nls_date_language=korean') "�Ի���"
    , to_char(add_months(hire_date+10, 5)+20*365, 'yyyy-mm-dd')  "������"
from employee
--
--134. �������� �ִ� �μ����� �μ���ȣ, �μ���ġ, �������� ����ϸ�? ��� �μ� �� ���Ͷ�
select dep_no, loc, (select count(*) from employee e where e.dep_no = d.dep_no)||'��' "������"
from dept d
--
--135. ������ �Ի��, �ο����� �˻��ϸ�? �Ի�� �������� ���� <����> �Ի�� �������� ����
--<����> �� ������� 2��, 9���� ��� ������. 2��, 9���� ���Խ�Ű�� �ο����� 0���� �����Ϸ���?
select extract(month from hire_date) "����", count(*)
from employee
group by extract(month from hire_date)
union select 2, 0 from dual
union select 9, 0 from dual
order by 1
--
--136. employee ���̺��� ���޼������ �����Ͽ� ���޺��� ����, ������տ���, �ο����� �˻��ϸ�? (���� ������ ���� ���;���)
select jikup, round(avg(salary),1), count(*)
from employee
group by jikup
order by decode(jikup, '����', 1, '����', 2, '����', 3,'�븮', 4, '����', 5, 6)
--137. �μ��� �μ���ȣ, �μ���, ������, �����̰����ϴ°����� �˻��ϸ�?
select d.dep_no, d.dep_name, count(distinct e.emp_no) "������", count(c.emp_no) "����"
from dept d, employee e, customer c
where d.dep_no = e.dep_no(+) and e.emp_no = c.emp_no(+)
group by d.dep_no, d.dep_name
order by 1
--
--138. �������� 60����� ���� �Ͽ� �Ʒ�ó�� ����ϸ�?
--������ȣ, ������, �ٹ�����, �����ϱ��� ���� �⵵, ����(��-��-�� ���ϸ�), �ҼӺμ���, ���ӻ����, ���ӻ�� �μ���.
--��, ��� ���� �� ������, ���� ���� ����� ���� ������ ������ ������ ���̰� ���� ����� ���;���.
select e.emp_no, e.emp_name
        , ceil((sysdate-e.hire_date)/365) "�ٹ�����"
        , -- 60 - ����(���� - ������� + 1)
        60 - (extract(year from sysdate)
            - to_number(case when substr(e.jumin_num, 7, 1) in('1', '2') then '19' else '20' end
                ||substr(e.jumin_num, 1, 2)) + 1) "�����ϱ��������⵵"
        , to_char(to_date(case when substr(e.jumin_num, 7, 1) in('1', '2') then '19' else '20' end
            ||substr(e.jumin_num, 1, 6), 'yyyymmdd'), 'yyyy-mm-dd day', 'nls_date_language=korean') "����"
        , d.dep_name, e2.emp_name, d2.dep_name
from employee e, dept d, employee e2, dept d2
where e.dep_no = d.dep_no(+) and e.mgr_emp_no = e2.emp_no(+)
    and e2.dep_no = d2.dep_no(+)
order by decode(e.jikup, '����', 1, '����', 2, '����', 3,'�븮', 4, '����', 5, 6)
    , case when substr(e.jumin_num, 7, 1) in('1', '2') then '19' else '20' end
            ||substr(e.jumin_num, 1, 6)
--
--140. ���� ������� ������ �˻��ϵ� 1����� 10������� �˻��ϸ�?
select * from (select rownum "RNUM", zxc.* from(
select * from employee order by salary
) zxc where rownum <= 10) where rnum >= 1
--
--140-6. �� ���� ������ 6����� 10����� �˻��ϸ�?
select * from (select rownum "RNUM", zxc.* from (
select * from customer
order by case when substr(jumin_num, 7, 1) in('1', '2') then '19' else '20' end||substr(jumin_num, 1, 6)
) zxc where rownum <= 10 ) where rnum >= 6

--
--140-7. ���� ���� ���� �� 2����� 5����� �˻��ϸ�?
select * from (select rownum "RNUM", zxc.* from (
select * from employee order by decode(jikup, '����', 1, '����', 2, '����', 3,'�븮', 4, '����', 5, 6)
) zxc where rownum <= 5) where rnum >= 2
--
--141. ���ú��� 10�� ���ı��� ��¥ �߿� �����, �Ͽ���, �������� ������ ���� ������ ���ϸ�?
select count(*) from (
    select sysdate "XDAY" from dual
    union select sysdate+1 from dual union select sysdate+2 from dual union select sysdate+3 from dual
    union select sysdate+4 from dual union select sysdate+5 from dual union select sysdate+6 from dual
    union select sysdate+7 from dual union select sysdate+8 from dual union select sysdate+9 from dual
    union select sysdate+10 from dual
) where to_char(xday, 'day', 'nls_date_language=korean') not in('�����', '�Ͽ���', '������')
--
--142. �̹��� �߿� �����, �Ͽ����� ������ ���� ������ ���ϸ�? = �̹��� ���� �� ���ϱ�
select count(*) from (
    select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd') "XDAY" from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+1 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+2 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+3 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+4 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+5 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+6 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+7 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+8 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+9 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+11 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+12 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+13 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+14 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+15 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+16 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+17 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+18 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+19 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+21 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+22 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+23 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+24 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+25 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+26 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+27 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+28 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+29 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+30 from dual
    union select to_date(to_char(sysdate, 'yyyymm')||'01', 'yyyymmdd')+31 from dual
) where to_char(xday, 'day', 'nls_date_language=korean') not in('�����', '�Ͽ���')
--
--146. employee ���̺�κ��� salary �÷��� �����ϰ� �� �� �� �ִ� �� employee_vw1�� �����ϸ�?
create view employee_vw1 as
select emp_no, emp_name, dep_no, jikup, hire_date, jumin_num, phone, mgr_emp_no from employee
--
--147. �� employee_vw1�� ������ '�̽¿�', 40, '����', '1990-09-01', '7811231452719', '01090056376', 1 �� �Է��ϸ�?
insert into employee_vw1 values((select nvl(max(emp_no),0)+1 from employee_vw1)
        , '�̽¿�', 40, '����', to_date('1990-09-01', 'yyyy-mm-dd'), '7811231452719', '01090056376', 1 )
--
--148. �� employee_vw1���� �ֹι�ȣ '7811231452719', ������ '�̽¿�'�� ������ �������� �����ϸ�?
update employee_vw1 set jikup = '����' where jumin_num='7811231452719' and emp_name = '�̽¿�'
--
--149. �� employee_vw1���� �ֹι�ȣ '7811231452719' �� ������ �����ϸ�?
delete from employee_vw1 where jumin_num = '7811231452719'
--
--150. �� employee_vw1 �� �����ϸ�?
drop view employee_vw1
--
--150-1. �μ���, ���޺� �μ���ȣ, �μ���, ����, ��տ����� ����ϴ� �� employee_vw3�� �����ϸ�?
create view employee_vw3 as
select d.dep_no, d.dep_name, e.jikup, avg(e.salary) "AVG_SALARY" from dept d, employee e where d.dep_no = e.dep_no group by dep_no, jikup
--
--151. ���� �信 ���� ������ ����ϸ�?
--CREATE VIEW employee_vw4 AS
--SELECT emp_no, emp_name, dep_no FROM employee;
--���� �並 ���� �� INSERT INTO employee_vw4 VALUES(21, '�����', 40);
--�����ϸ� �����ϳ� �����ϳ�?
--
--
--152. ���� �信 ���� ������ ����ϸ�?
--INSERT INTO dept VALUES(60, '������', '�λ�');
--CREATE VIEW dept_vw1 AS
--SELECT dep_no, dep_name, loc FROM dept
--WHERE dep_no = 60 WITH CHECK OPTION;
--����!!
--UPDATE dept_vw1 SET dep_no = 70 WHERE dep_no = 60; �� �����ϸ�?
--
--156. employee ���̺� '�庸��', 40, '�븮', 3500, '2012-05-28', '8311091109310', '01092499215', 3 �����͸� �Է��ϸ�?
insert into employee values((select nvl(max(emp_no), 0)+1 from employee), '�庸��'
        , 40, '�븮', 3500, to_date('2012-05-28', 'yyyy-mm-dd'), '8311091109310', '01092499215', 3)
--
--157. employee ���̺��� ���� ��ȣ�� 18�� �̰�, �ֹι�ȣ '8203121977315'�� '������' ������ ������ '����'���� �����Ϸ���?
update employee set jikup = '����' where emp_no = 18
--
--158. ���� ������ ������ 500���� �λ��ϴ� UPDATE ����?
update employee set salary = salary + 500 where substr(jumin_num,7,1) in('2', '4')
--
--159. employee ���̺��� ��� ���� �̻��� ���� ������ 2% �谨�ϸ�?
update employee set salary = salary*0.98 where salary >= (select avg(salary) from employee)
--
--160. employee ���̺��� ��� ���� ���� ���� �������� ������ 50���� �λ��ϸ�?
update employee set salary = salary + 50 where salary < (select avg(salary) from employee)
--
--161. ��� ���� �ִ� ������ �޿��� 5% �λ��ϸ�?
update employee set salary = salary*1.05 where emp_no in(select distinct emp_no from customer where emp_no is not null)
--
--162. ���� ���� 2~5������ 5���� ������ 10% �����ϸ�?
--���� ���� �� �������� ���� > ���� ���� ���� > �Ի��� ���� ���� > ���� ���� ����
update employee set salary = salary*0.9 where emp_no in(select emp_no from employee order by
    salary desc, decode(jikup, '����', 1, '����', 2, '����', 3, '�븮', 4, '����', 5, 6), hire_date
    , case when substr(jumin_num, 7, 1) in('1', '2') then '19' else '20' end||substr(jumin_num,1,6) )
--
--163. employee�� �Ȱ��� ������ �Ȱ��� �����͸� ���� �ֵ��� ���̺� employee2 �����?
create table employee2 as select * from employee
--
--164. employee�� �Ȱ��� ������ ���� �ֵ��� ���̺� employee3�� ����� �����ʹ� ������ ���� ��������?
create table employee3 as select * from employee where 1=2
--
--
--

-- board sql
select * from board

-- ���� �� ó�� �� ���
insert into board(b_no, subject, writer, content, pwd, email, group_no, print_no, print_level)
    values((select nvl(max(b_no),0)+1 from board), '����', '����', 'asd', '123','add@navd.com'
            , (select nvl(max(b_no), 0)+1 from board), 0, 0)

-- b_no =3�� ��� �ޱ�
-- b_no = 3 ��ȸ�� + 1
update board set readcount=readcount+1 where b_no=3

-- b_no =3 ������ ��¼�����ȣ +1
update board set print_no = print_no+1 where group_no = (select group_no from board where b_no=3)
        and print_no > (select print_no from board where b_no=3)

-- b_no=3�� ��� �Է�
insert into board(b_no, subject, writer, content, pwd, email, group_no, print_no, print_level)
    values((select nvl(max(b_no), 0)+1 from board), '�Ͼ�����', '����', 'asss', '123', '222@naver.com'
            , (select group_no from board where b_no=3)
            , (select print_no+1 from board where b_no=3)
            , (select print_level+1 from board where b_no=3))

select * from board

-- �Խ����� ��� �� ���, �ܼ�������ȣ, ����, �۾���, �ۼ���, ��ȸ��,
-- ���� ���� �׷��ȣ ��������, ��¼�����ȣ ��������
-- �鿩���� ǥ��
select x.cnt- rownum + 1 "NUM", zxc.* from (
    select lpad(' ', print_level*7, ' ' )||decode(print_level, 0, '', '��')||subject "SUBJECT", writer
        , to_char(reg_date, 'yyyy-mm-dd') "REG_DATE", readcount
    from board
    order by group_no desc, print_no ) zxc, (select count(*) "CNT" from board) x