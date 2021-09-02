--< ����Ŭ ���� >

-- 21.08.27 ��
--15. employee ���̺��� ��� �÷�, ��� ���� �����͸� �˻��ϸ�?
select * from employee
--16. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date �÷��� �����͸� �˻��ϸ�?
select emp_no, emp_name, jikup, salary, hire_date from employee
--17. employee ���̺��� emp_no, emp_name, jikup, salary, hire_date�� �˻��ϸ鼭
--��Ī(=alias)�� �����ȣ, ������, ����, ����, �Ի��Ϸ� �ϰ� ������ '����' �̶� ���ڸ� �ٿ� �˻��ϸ�?
select emp_no as "�����ȣ", emp_name as "������", jikup as "����", salary||'����' as "����", hire_date as "�Ի���" from employee
--18. employee ���̺��� ������, ����, ����, ����, �Ǽ��ɾ��� �˻��ϸ�? (������ ������ 12%)
select emp_name, jikup, salary, salary*0.12 from employee
--19. employee ���̺��� ������ �ߺ� ���� �˻��ϸ�?
select distinct jikup from employee
select unique jikup from employee
--20. employee ���̺��� �μ���ȣ�� ������ �ߺ� ���� �˻��ϸ�?
select distinct dep_no, jikup from employee
--21. employee ���̺��� ������ 3000 �̻��� ������ �˻��ϸ�?
select * from employee where salary >=3000
--22. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by salary
--23. employee ���̺��� ���� ������������ �˻��ϸ�?
select * from employee order by salary desc
--24. employee ���̺��� �μ���ȣ ���������� �����ϸ鼭 ���� ������������ �˻��ϸ�?
select * from employee order by dep_no, salary desc
--25. employee ���̺��� ������ ���� ���� �����ؼ� �˻��ϸ�?
select * from employee order by decode(jikup, '����',1, '����',2,'����',3,'�븮',4,'����',5,6)
--26. employee ���̺��� ���常 �˻��ϸ�?
select * from employee where jikup='����'
--27. employee ���̺��� 20�� �μ��� ���常 �˻��ϸ�?
select * from employee where dep_no=20 and jikup='����'
--28. employee ���̺��� 20�� �μ� �Ǵ� ������ �˻��ϸ�?
select * from employee where dep_no=20 or jikup='����'
--29. employee ���̺��� ���� �߿� ���� 3400 �̻��� �˻��ϸ�?
select * from employee where jikup='����' and salary >= 3400
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
select min(salary) as "�ּҿ���"
    , max(salary) as "�ִ뿬��"
    , avg(salary) as "��տ���"
    , sum(salary) as "��������"
    , count(*) as "���ο���"
from employee
--37. �Ʒ� SQL ������ ���� ������ ���ΰ�?
--SELECT COUNT(emp_no) FROM customer;
--
--
--38. ���� ����ϰ� �ִ� ������ �����?
select count(distinct emp_no) from customer
--39. ���� ����� �ִ� ������ �����?
select count(mgr_emp_no) from employee
--39-1. ���������� �ִ� ������ �����?
select count(distinct mgr_emp_no) from employee
--40. employee ���̺��� ������ȣ, ������, ���Ͽ�-������ �˻��ؼ� ����ϸ�?
select emp_no, emp_name, substr(jumin_num, 3, 2)||'-'||substr(jumin_num, 5, 2) as "����" from employee
--41. customer ���̺��� ��� �÷�, ��� ���� �˻��ؼ� ����ϸ�? ��, �ֹι�ȣ�� 901225-2****** ���·� ����ϼ���.
select cus_no, cus_name, tel_num, substr(jumin_num,1,6)||'-'||substr(jumin_num,7,1)||'******' as "�ֹι�ȣ"
from customer
--42. customer ���̺��� ����ȣ, ����, ���������ȣ�� ����ϸ�? ��, ���������ȣ�� ������ NULL ������� ���� '����' ǥ��
select cus_no, cus_name, nvl(emp_no||'', '����') from customer
--43. customer ���̺��� ����ȣ, ����, ����������翩�θ� ����ϸ�? ��, ������ȣ�� ������ "����", ������ "����"���� ǥ��
select cus_no, cus_name, nvl2(emp_no, '����', '����') from customer
--44. employee ���̺��� ������ȣ, ������, ����, ������ ����ϸ�?
select emp_no, emp_name, jikup, case when substr(jumin_num, 7, 1) in('1', '3') then '��' else '��' end as "����" from employee
--45. employee ���̺��� ������ȣ, ������, ����, ����⵵�� ����ϸ�?
select emp_no, emp_name, jikup
    , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2) as "����⵵"
from employee
--46. employee ���̺��� ������ȣ, ������, ����, ������(4�ڸ�)�� ����ϸ�?
select emp_no, emp_name, jikup
    , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,1)||'0��' as "������"
from employee
--47. employee ���̺��� ���̼����� ����ϸ�?
select * from employee order by case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)
--48. employee ���̺��� ���� ������� �����Ͽ� ��� �÷��� ���̸�?
select * from employee order by decode(jikup, '����',1,'����',2,'����',3,'�븮',4,'����',5,6)
--49. employee ���̺��� ������ȣ, ������, �Ի���(��-��-��(����) �б� �ú���) �˻��ϸ�?
select emp_no, emp_name, to_char(hire_date,'yyyy-mm-dd(dy) q hh:mi:ss','nls_date_language=korean') as "�Ի���"
from employee
--49-1. employee ���̺��� ������ȣ, ������, �Ի���(x��-x��-x��(����) x�б� x��x��x��) �˻��ϸ�?
select emp_no, emp_name
    , to_char(hire_date, 'yyyy"��"mm"��"dd"��"(day) q"�б�" hh"��"mi"��"ss"��"', 'nls_date_language=korean') as "�Ի���"
from employee
--50. employee ���̺��� ������ȣ, ������, ���� �˻��ϸ�?
select emp_no, emp_name
    , extract(year from sysdate)
     - to_number(case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1 as "����"
from employee
--51. employee ���̺��� ������ȣ, ������, �ٹ������� �˻��ؼ� ����ϸ�?
select emp_no, emp_name, ceil((sysdate-hire_date)/365)||'����' as "�ٹ�����" from employee
--52. employee ���̺��� ������ȣ, ������, ���ɴ븦 �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , floor((extract(year from sysdate)
        - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) +1)*0.1)||'0��'
        as "���ɴ�"
from employee
--53. employee ���̺��� ������ȣ, ������, 100�� ��ġ ��¥(��-��-��)�� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , to_char(to_date(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end
        ||substr(jumin_num,1,6), 'yyyymmdd')+100, 'yyyy-mm-dd') as "100����ġ��¥"
from employee
--53-1. �������� 2021�� 5�� 12���̰� �������� 2021�� 11�� 10�� �̴�. ��ĥ ���� �п� ��Ȱ�� �ϳ�?
select to_date('20211110','yyyymmdd')-to_date('20210512','yyyymmdd') from dual
--54. employee ���̺��� ������ȣ, ������, ���糪��, �Ի��� ��� ���̸� �˻��ؼ� ����ϸ�?
select emp_no, emp_name
    , extract(year from sysdate)
    - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1
    as "���糪��"
    , extract(year from hire_date)
    - to_number(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end||substr(jumin_num,1,2)) + 1
    as "�Ի��ϴ�ó���"
from employee
--55. employee ���̺��� ������ȣ, ������, �ֹι�ȣ, �ٰ��û��ϳ�(��-��-��), ���ϱ��� �����ϼ��� �˻��ϸ�?
select emp_no, emp_name, jumin_num
    , -- ���� - ���� > 0 ����, �ƴϸ� ����
    to_char(to_date(case
        when to_number(substr(jumin_num,3,4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else extract(year from sysdate) +1
    end||substr(jumin_num,3,4), 'yyyymmdd'), 'yyyy-mm-dd') as "�ٰ��û��ϳ�"
    , ceil(to_date(case
        when to_number(substr(jumin_num,3,4)) - to_number(to_char(sysdate, 'mmdd')) >= 0 then extract(year from sysdate)
        else extract(year from sysdate) +1
    end||substr(jumin_num,3,4), 'yyyymmdd') - sysdate)||'��' as "���ϱ��������ϼ�"
from employee
--56. employee ���̺��� ������ȣ, ������, ����, ����(xxx,xxx,xxx����)�� �˻��ϸ�?
select emp_no, emp_name, jikup, to_char(salary, '999,999,999')||'����' as "����" from employee
--57. employee ���̺��� �����Ͽ� �¾ ������ �˻��϶�
select * from employee
where to_char(to_date(case when substr(jumin_num, 7, 1) in('1','2') then '19' else '20' end
            ||substr(jumin_num,1,6),'yyyymmdd'), 'day','nls_date_language=korean') = '������'
--58. employee ���̺��� 70���� ���� ������ �˻��϶�
select * from employee where substr(jumin_num,1,1)='7' and substr(jumin_num,7,1)='1'
--59. employee ���̺��� 1960���, 1970��� ����� �� ���ڸ� �˻��϶�
select * from employee where substr(jumin_num,1,1) in('6','7') and substr(jumin_num,7,1)='1'
--60. employee ���̺��� ���� �ٹ��� ������ ���� ������ �˻��ϸ�?
select * from employee order by sysdate-hire_date desc
--
--61. ������ȣ, ������, �ٹ��ϼ�, �ٹ�������, �Ի��� 5���� �� ��¥(��-��-��),
--�Ի��� ���� ������ ��¥(��-��-��), �Ի��� ��¥ ���� ���ƿ��� �Ͽ��ϳ�¥(��-��-��)�� �˻��ϸ�?
--��, �ٹ��ϼ��� �Ҽ� 2�ڸ����� �ݿø�
select emp_no, emp_name
    , round(sysdate-hire_date, 1) as "�ٹ��ϼ�"
    , round(months_between(sysdate,hire_date),1) as "�ٹ�������"
    , to_char(add_months(hire_date,5),'yyyy-mm-dd') as "�Ի���5������"
    , to_char(last_day(hire_date),'yyyy-mm-dd') as "�Ի�޸�������"
    , to_char(next_day(hire_date, 1),'yyyy-mm-dd') as "�Ի糯ù��°�Ͽ���"
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
select * from employee where dep_no in(10,20) and jikup='����'
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
select * from employee where hire_date >= to_date('1995-01-01', 'yyyy-mm-dd')
--74. employee ���̺��� �Ի����� 1990�� ~ 1999�� ������ ������ �˻��ϸ�?
select * from employee where hire_date between to_date('19900101','yyyymmdd') and to_date('19991231', 'yyyymmdd')
--75. employee ���̺��� �μ���ȣ�� 10�� �Ǵ� 30���� ���� �߿� ������ 3000 �̸��̰� �Ի����� '1996-01-01' �̸� ������ �˻��ϸ�?
select * from employee where dep_no in(10,30) and salary < 3000 and hire_date < to_date('1996-01-01', 'yyyy-mm-dd')
--76. employ ���̺��� ���� �达�� ������ �˻��ϸ�?
select * from employee where emp_name like '��%'
--77. employ ���̺��� ���� Ȳ���� ������ �˻��ϸ�?
select * from employee where emp_name like 'Ȳ%' and emp_name not like 'Ȳ��%'
--78. employee ���̺��� �̸��� 2���� ������ �˻��ϸ�?
select * from employee where length(emp_name) = 2
--79. employee ���̺��� �̸��� ������ ������ ������ �˻��ϸ�?
select * from employee where emp_name like '%��'
--80. employee ���̺��� ���� �达�̰� 3������ ������ �˻��ϸ�?
select * from employee where emp_name like '��__'
--81. employee ���̺��� �̸��� ���̶� ���ڸ� ���� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%'
--82. employee ���̺��� ���� �达�� �ƴ� ������ �˻��ϸ�?
select * from employee where emp_name not like '��%'
--83. employee ���̺��� �̸� �߰����� ���� �� ������ �˻��ϸ�?
select * from employee where emp_name like '%��%' and emp_name not like '��%' and emp_name not like '%��'
--84. employee ���̺��� ���� ������ �˻��϶�
select * from employee where substr(jumin_num,7,1) in('2','4')
--85. employee ���̺��� 1960���, 1970��� ������� ���ڸ� �˻��϶�
select * from employee where substr(jumin_num,1,1) in('6','7') and substr(jumin_num,7,1) ='1'
--86. ������ȣ, ������, �ҼӺμ��� �˻�?
--87. ����ȣ, ����, ����������̸� �˻��ϸ�?
--88. ��� �������� ���� �޴� ������ �˻��ϸ�?
--89. ���޺�, ��տ��� �˻��ϸ�?
--
--90. ������ȣ, ������, �ҼӺμ��� �˻�?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no

select e.emp_no, e.emp_name, d.dep_name
from employee e inner join dept d on e.dep_no = d.dep_no
--91. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no


select * from customer
--92. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> 10�� �μ��� ��������� �ִ� ���� ���
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.dep_no=10

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no
where e.dep_no=10


-- 21.08.29 �Ͽ���
--93. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ������ 3000���� �̻��� ��������� �ִ� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no and e.salary >= 3000

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c inner join employee e on c.emp_no = e.emp_no and e.salary >= 3000

--94. ������, ��������, �����μ���, ������, ����ȭ�� ����ϸ�? <����> ���� �̸� �������� ����
select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e, dept d, customer c
where e.dep_no=d.dep_no and e.emp_no = c.emp_no
order by e.emp_name

select e.emp_name, e.jikup, d.dep_name, c.cus_name, c.tel_num
from employee e inner join dept d on e.dep_no=d.dep_no
                inner join customer c on e.emp_no = c.emp_no
order by e.emp_name

--95. ������, ��������, �ҼӺμ���, ��������� ����ϸ�? ������� ��������, ���޳������� ��������, ���̳������� ���� ���� ���
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e, dept d, salary_grade s
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(jikup, '����',1, '����',2,'����',3,'�븮',4,'����',5,6)
        , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)

select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no
from employee e inner join dept d on e.dep_no = d.dep_no
                inner join salary_grade s on e.salary between s.min_salary and s.max_salary
order by s.sal_grade_no, decode(jikup, '����',1, '����',2,'����',3,'�븮',4,'����',5,6)
        , case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)

--96. ����������, ������������, ���ӻ����, ���ӻ�������� ����ϸ�? <����> ����� �ִ� ������ ����
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.mgr_emp_no = e2.emp_no

select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e inner join employee e2 on e.mgr_emp_no = e2.emp_no
--97. ���ӻ����, ���ӻ������, ����������, �������������� ����ϸ�? <����> ����� �ִ� ������ ����
select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e, employee e2
where e.emp_no = e2.mgr_emp_no

select e.emp_name, e.jikup, e2.emp_name, e2.jikup
from employee e inner join employee e2 on e.emp_no = e2.mgr_emp_no

--98. ������, ��������, �ҼӺμ���, �������, ���ӻ����, ���ӻ������, �������� ����ϸ�?
select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e, dept d, salary_grade s, employee e2, customer c
where e.dep_no = d.dep_no and e.salary between s.min_salary and s.max_salary
    and e.mgr_emp_no = e2.emp_no and e.emp_no = c.emp_no

select e.emp_name, e.jikup, d.dep_name, s.sal_grade_no, e2.emp_name, e2.jikup, c.cus_name
from employee e inner join dept d on e.dep_no = d.dep_no
                inner join salary_grade s on e.salary between s.min_salary and s.max_salary
                inner join employee e2 on e.mgr_emp_no = e2.emp_no
                inner join customer c on e.emp_no = c.emp_no
--99. ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> ��������� ���� ���� ����
select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+)

select c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no

--100. ����ȣ, ����, ����ȭ��ȣ, ���������, ������������� ����ϸ�? <����> �������� ��� ���̰� ���������� 10�� �μ��� ���� ��
select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c, employee e
where c.emp_no = e.emp_no(+) and e.dep_no(+)=10

select c.cus_no, c.cus_name, c.tel_num, e.emp_name, e.jikup
from customer c left outer join employee e on c.emp_no = e.emp_no and e.dep_no=10
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
from customer c inner join employee e on c.emp_no = e.emp_no
where e.salary >= 3000
--103. ����ȣ, ����, ���ֹι�ȣ�� ����϶�. ��, 40�� �̻��� ��������� ����� �� �̾�� �Ѵ�.
select c.cus_no, c.cus_name, c.jumin_num
from customer c, employee e
where c.emp_no = e.emp_no and
   40 <= extract(year from sysdate)
    - to_number(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,2)) + 1

select c.cus_no, c.cus_name, c.jumin_num
from customer c inner join employee e on c.emp_no = e.emp_no
where 40 <= extract(year from sysdate)
    - to_number(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,2)) + 1
--103-1. 10�� �μ� �Ǵ� 30�� �μ� ������ ����ϴ� ���� �˻��ϸ�?
select * from employee e, customer c where e.emp_no=c.emp_no and e.dep_no in('10','30')

select * from employee e inner join customer c on e.emp_no=c.emp_no where e.dep_no in('10','30')
--
--104. ����ȣ, ����,
--���������ȣ,���������, ��������ҼӺμ���, ��������������, ����������ӻ����, ����������ӻ������,
--���ӻ��������� ����϶�. ��, ���� �� ���;� �ϰ� NULL�� �������� ǥ��
select c.cus_no, c.cus_name, nvl(e.emp_no||'', '����'), nvl(e.emp_name||'', '����')
    , nvl(d.dep_name||'', '����'), nvl(s.sal_grade_no||'', '����')
    , nvl(e2.emp_name||'', '����'), nvl(e2.jikup||'', '����'), nvl(s2.sal_grade_no||'', '����')
from customer c, employee e, dept d, salary_grade s, employee e2, salary_grade s2
where c.emp_no = e.emp_no(+) and e.dep_no = d.dep_no(+) and e.salary between s.min_salary(+) and s.max_salary(+)
    and e.mgr_emp_no = e2.emp_no(+) and e2.salary between s2.min_salary(+) and s2.max_salary(+)


select c.cus_no, c.cus_name, nvl(e.emp_no||'', '����'), nvl(e.emp_name||'', '����')
    , nvl(d.dep_name||'', '����'), nvl(s.sal_grade_no||'', '����')
    , nvl(e2.emp_name||'', '����'), nvl(e2.jikup||'', '����'), nvl(s2.sal_grade_no||'', '����')
from customer c left outer join employee e on c.emp_no = e.emp_no
                left outer join dept d on e.dep_no = d.dep_no
                left outer join salary_grade s on e.salary between s.min_salary and s.max_salary
                left outer join employee e2 on e.mgr_emp_no = e2.emp_no
                left outer join salary_grade s2 on e2.salary between s2.min_salary and s2.max_salary
--
--
--105. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����� �� ��
select emp_name||'����' as "�̸�", phone from employee
union
select cus_name||'��', tel_num from customer
--106. ������, ������ȭ��ȣ �� ����, ����ȭ��ȣ�� ������ �ٿ� ����϶�. ������ �ߺ����
select emp_name||'����' as "�̸�", phone from employee
union all
select cus_name||'��', tel_num from customer
--108. �ְ� ������ �޴� ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee)
--109. ��� ���� �̻��� �޴� ������ �˻��϶�
select * from employee where salary >= (select avg(salary) from employee)
--110. 20�� �μ����� �ְ� ������ ������ �˻��϶�
select * from employee where salary = (select max(salary) from employee where dep_no=20) and dep_no=20
--
--111. ������, ����, ����, ��ü�������� �����ϴ� ������ �˻��϶�. ��, ��ü�������� �����ϴ� ������ �Ҽ��� �����ϰ� %�� ǥ���϶�.
--��, ���� ������ ���� ������ �����϶�.
select emp_name, jikup, salary, floor(salary/(select sum(salary) from employee)*100)||'%' "����"
from employee
order by salary/(select sum(salary) from board)*100 desc
--
--112. 10�� �μ� �������� �����ϴ� ����ȣ, ����, ������ȣ�� �˻��ϸ�?
select cus_no, cus_name, emp_no
from customer c
where emp_no in(select emp_no from employee where dep_no=10)
--113. ��� ���� �̻��̰� �ִ� ���� �̸��� ������, ����, ��ü��տ���, ��ü�ִ뿬���� ����ϸ�?
select emp_name, salary, (select avg(salary) from employee) as "��ü��տ���", (select max(salary) from employee) as "��ü�ִ뿬��"
from employee
where salary >= (select avg(salary) from employee) and salary < (select max(salary) from employee)
--114. �ְ� ���� ������ ������ȣ, ������, �μ���, ������ �˻��ϸ�?
select e.emp_no, e.emp_name, d.dep_name, e.salary
from employee e, dept d
where e.dep_no=d.dep_no and e.salary = (select max(salary) from employee)
--115. ��� ���� 2�� �̻��� ������ȣ, ������, ������ �˻��ϸ�?
select e.emp_no, e.emp_name, e.jikup
from employee e
where 2 <= (select count(emp_no) from customer c where e.emp_no=c.emp_no)
--116. ������ȣ, ������, �ҼӺμ����� �˻��ϸ�?
select e.emp_no, e.emp_name, d.dep_name
from employee e, dept d
where e.dep_no = d.dep_no

select e.emp_no, e.emp_name, d.dep_name
from employee e inner join dept d on e.dep_no = d.dep_no
--117. ������ȣ, ������, ����, ���� ������ ����ϸ�? ��, ���� ������ �������� ����
select e.emp_no, e.emp_name, e.salary, (select count(*)+1 from employee e2 where e.salary < e2.salary) as "��������"
from employee e
order by 4
--118. ������ȣ, ������, �������� ����ϸ�?
select e.emp_no, e.emp_name, (select count(*) from customer c where c.emp_no=e.emp_no) as "������"
from employee e
--119. �μ���, �μ�������, �μ��������� ����ϸ�?
select d.dep_name, (select count(*) from employee e where e.dep_no=d.dep_no) as "�μ�������"
    , (select count(*) from employee e, customer c where e.emp_no=c.emp_no and d.dep_no=e.dep_no) as "�μ�������"
from dept d
--
--120. ������ȣ, ������, ����, �ֹι�ȣ, ���޼��������� ����ϸ�?
--��, ������ ������ ���� ���� ������ ���޼������� �̴�. �׸��� ���޼��������� �������� ����
select e.emp_no, e.emp_name, e.jikup, e.jumin_num
    , (select count(*)+1 from employee e2
        where (e.jikup <> e2.jikup and decode(e.jikup,'����',1,'����',2,'����',3,'�븮',4,'����',5,6)
        > decode(e2.jikup,'����',1,'����',2,'����',3,'�븮',4,'����',5,6))
        or (e.jikup = e2.jikup and
        case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num,1,6)
        > case when substr(e2.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e2.jumin_num,1,6))
         ) as "���޼�������"
from employee e
order by 5
--
--121. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����> ��������� ���� ���� ����. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select cus_no, cus_name, tel_num
    ,(select emp_name from employee e where e.emp_no=c.emp_no) as "���������"
    ,(select jikup from employee e where e.emp_no=c.emp_no) as "�����������"
    ,(select dep_no from employee e where e.emp_no=c.emp_no) as "�μ���ȣ"
from customer c
--
--122. ����ȣ, ����, ����ȭ��ȣ, ���������, �����������, �μ���ȣ�� ����ϸ�?
--<����>�������� ��� ���̰� ���������� 10�� �μ��� ���� ��. ��, ������ ������� ���� ���������� ����Ͻʽÿ�.
select cus_no, cus_name, tel_num
    ,(select emp_name from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "���������"
    ,(select jikup from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "�����������"
    ,(select dep_no from employee e where e.emp_no=c.emp_no and e.dep_no=10) as "�μ���ȣ"
from customer c
--
--124. �μ����� �μ���ȣ, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select d.dep_no, sum(e.salary) as "SUM_SALARY", round(avg(e.salary),1) "AVG_SALARY", count(*) "CNT"
from dept d, employee e
where d.dep_no=e.dep_no
group by d.dep_no
--125. ���޺��� ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by jikup
--126. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�? ��, ����� �Ҽ� ��° �ڸ����� �ݿø� �� ��
select dep_no, jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, jikup
--127. �μ���, ���޺�, �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϵ� �ο����� 3�� �̻��� ����ϸ�?
select dep_no, jikup, sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, jikup
having count(*) >= 3
--128. �μ���, ������ �μ���ȣ, ����, �޿���, ��ձ޿�, �ο����� ����ϸ�?
select dep_no, case when substr(jumin_num,7,1) in('1','3') then '��' else '��' end as "����"
        , sum(salary) as "SUM_SALARY", round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by dep_no, case when substr(jumin_num,7,1) in('1','3') then '��' else '��' end
--129. �Ի�⵵���� �Ի�⵵, �ο����� ����ϰ� �⵵���� �������� �ϸ�?
select extract(year from hire_date) as "�Ի�⵵", count(*) as "CNT"
from employee
group by extract(year from hire_date)
order by 1
--130. �μ����� �μ���ȣ, ��ձٹ������ ����ϸ�? (�ٳ���� �Ҽ��� ��° �ڸ����� �ݿø��� ��)
select dep_no, round(avg((sysdate-hire_date)/365),1) as "��ձٹ����"
from employee
group by dep_no
--131. �Ի�б⺰�� �Ի�б�, �ο����� ����ϸ�?
select to_char(hire_date, 'q') as "Q", count(*) as "CNT"
from employee
group by to_char(hire_date, 'q')
--132. �Ի翬�뺰, ������ �Ի翬��, ����, ���뺰�Ի��ڼ� ����ϸ�?
select substr(extract(year from hire_date),1,3)||'0���' as "HIRE_DATE"
    , case when substr(jumin_num,7,1) in('1','3') then '��' else '��' end as "GENDER", count(*)
from employee
group by substr(extract(year from hire_date),1,3)||'0���', case when substr(jumin_num,7,1) in('1','3') then '��' else '��' end
--
--133. ������, �Ի���(��-��-�� ~/4�б� �ѱ� 1�ڸ� ����), ������(��-��-��) ����ϸ�?
--<����> �������� �Ի� �� 20�� 5���� 10�� ��
select emp_name, to_char(hire_date, 'yyyy-mm-dd q"/�б�" dy', 'nls_date_language=korean') as "�Ի���"
    , to_char(add_months(hire_date+10, 5)+20*365,'yyyy-mm-dd') as "������"
from employee
--
--134. �������� �ִ� �μ����� �μ���ȣ, �μ���ġ, �������� ����ϸ�? ��� �μ� �� ���Ͷ�
select dep_no, loc, (select count(*) from employee e where e.dep_no=d.dep_no)
from dept d

select d.dep_no, d.loc, count(e.emp_no)
from dept d, employee e
where d.dep_no=e.dep_no(+)
group by d.dep_no, d.loc
--
--135. ������ �Ի��, �ο����� �˻��ϸ�? �Ի�� �������� ���� <����> �Ի�� �������� ����
--<����> �� ������� 2��, 9���� ��� ������. 2��, 9���� ���Խ�Ű�� �ο����� 0���� �����Ϸ���?
select extract(month from hire_date) as "HIRE_DATE_MONTHS", count(*) as "CNT"
from employee
group by extract(month from hire_date)
union select 2, 0 from dual
union select 9, 0 from dual
order by 1
--
--136. employee ���̺��� ���޼������ �����Ͽ� ���޺��� ����, ������տ���, �ο����� �˻��ϸ�? (���� ������ ���� ���;���)
select jikup, round(avg(salary),1) as "AVG_SALARY", count(*) as "CNT"
from employee
group by jikup
order by decode(jikup, '����',1,'����',2,'����',3,'�븮',4,'����',5,6)
--137. �μ��� �μ���ȣ, �μ���, ������, �����̰����ϴ°����� �˻��ϸ�?
select d.dep_no, d.dep_name, count(distinct e.emp_no) as "EMP_CNT", count(c.emp_no) as "CUS_CNT"
from dept d, employee e, customer c
where d.dep_no=e.dep_no(+) and e.emp_no = c.emp_no(+)
group by d.dep_no, d.dep_name
--
--138. �������� 60����� ���� �Ͽ� �Ʒ�ó�� ����ϸ�?
--������ȣ, ������, �ٹ�����, �����ϱ��� ���� �⵵, ����(��-��-�� ���ϸ�), �ҼӺμ���, ���ӻ����, ���ӻ�� �μ���.
--��, ��� ���� �� ������, ���� ���� ����� ���� ������ ������ ������ ���̰� ���� ����� ���;���.
select e.emp_no, e.emp_name
    , ceil((sysdate-e.hire_date)/365) as "HIRE_YEAR"
    , to_char(to_date(case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end
            ||substr(e.jumin_num, 1,6),'yyyymmdd'),'yyy-mm-dd', 'nls_date_language=korean') as "BIRTH"
    , d.dep_name, e2.emp_name, d2.dep_name
from employee e, dept d, employee e2, dept d2
where e.dep_no = d.dep_no(+) and e.mgr_emp_no=e2.emp_no(+) and e2.dep_no = d2.dep_no(+)
order by decode(e.jikup,'����',1,'����',2,'����',3,'�븮',4,'����',5,6)
    , case when substr(e.jumin_num,7,1) in('1','2') then '19' else '20' end||substr(e.jumin_num, 1,6)
--
--140. ���� ������� ������ �˻��ϵ� 1����� 10������� �˻��ϸ�?
select * from (select rownum "RNUM", zxc.*
from (
    select * from employee order by salary
) zxc where rownum <= 10) where rnum >=1
--
--140-6. �� ���� ������ 6����� 10����� �˻��ϸ�?
select * from (select rownum "RNUM", zxc.* from (
    select * from customer
    order by case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,6)
) zxc where rownum <= 10) where rnum >= 6
--
--140-7. ���� ���� ���� �� 2����� 5����� �˻��ϸ�?
select * from (select rownum as "RNUM", zxc.* from(
select * from employee order by decode(jikup,'����',1,'����',2,'����',3,'�븮',4,'����',5,6)
) zxc where rownum <= 5) where rnum >=2
--

-- 21.09.02 ��
--141. ���ú��� 10�� ���ı��� ��¥ �߿� �����, �Ͽ���, �������� ������ ���� ������ ���ϸ�?
select count(*) from (
    select sysdate "TODAY" from dual
    union select sysdate+1 from dual union select sysdate+2 from dual union select sysdate+3 from dual
    union select sysdate+4 from dual union select sysdate+5 from dual union select sysdate+6 from dual
    union select sysdate+7 from dual union select sysdate+8 from dual union select sysdate+9 from dual
    union select sysdate+10 from dual
) where to_char(today, 'day', 'nls_date_language=korean') not in('�����', '�Ͽ���', '������')

--
--142. �̹��� �߿� �����, �Ͽ����� ������ ���� ������ ���ϸ�? = �̹��� ���� �� ���ϱ�
--
--146. employee ���̺�κ��� salary �÷��� �����ϰ� �� �� �� �ִ� �� employee_vw1�� �����ϸ�?
create view employee_vw1 as select emp_no, emp_name, dep_no, jikup, hire_date,jumin_num,phone,mgr_emp_no from employee

--
--147. �� employee_vw1�� ������ '�̽¿�', 40, '����', '1990-09-01', '7811231452719', '01090056376', 1 �� �Է��ϸ�?
insert into employee_vw1(emp_no, emp_name, dep_no, jikup, hire_date,jumin_num,phone,mgr_emp_no )
    values((select nvl(max(emp_no, 0)+1 from employee)
        , '�̽¿�', 40, '����', to_date('1990-09-01', 'yyyy-mm-dd'), '7811231452719', '01090056376', 1 )
--
--148. �� employee_vw1���� �ֹι�ȣ '7811231452719', ������ '�̽¿�'�� ������ �������� �����ϸ�?
update employee_vw1 set jikup='����' where jumin_num='7811231452719' and emp_name='�̽¿�'
--
--149. �� employee_vw1���� �ֹι�ȣ '7811231452719' �� ������ �����ϸ�?
delete from employee_vw1 where jumin_num='7811231452719'
--
--150. �� employee_vw1 �� �����ϸ�?
drop view employee_vw1
--
--150-1. �μ���, ���޺� �μ���ȣ, �μ���, ����, ��տ����� ����ϴ� �� employee_vw3�� �����ϸ�?
create view employee_vw3 where
select d.dep_no, d.dep_name, e.jikup, avg(e.salary) as "AVG_SALARY"
    from dept d, employee e
    where d.dep_no = e.dep_no
    group by d.dep_no, d.dep_name, e.jikup
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
insert into employee(emp_no, emp_name, dep_no, jikup, salary, hire_date, jumin_num, phone, mgr_emp_no)
    values((select nvl(max(emp_no),0)+1 from employee)
            ,'�庸��', 40, '�븮', 3500, to_date('2012-05-28', 'yyyy-mm-dd'), '8311091109310', '01092499215', 3  )
--
--157. employee ���̺��� ���� ��ȣ�� 18�� �̰�, �ֹι�ȣ '8203121977315'�� '������' ������ ������ '����'���� �����Ϸ���?
update employee set jikup='����' where emp_no=18
--
--158. ���� ������ ������ 500���� �λ��ϴ� UPDATE ����?
update employee set salary=salary+500 where substr(jumin_num,7,1) in('2','4')
--
--159. employee ���̺��� ��� ���� �̻��� ���� ������ 2% �谨�ϸ�?
update employee set salary=salary*0.98 where salary >= (select avg(salary) from employee)
--
--160. employee ���̺��� ��� ���� ���� ���� �������� ������ 50���� �λ��ϸ�?
update employee set salary=salary+50 where salary < (select avg(salary) from employee)
--
--161. ��� ���� �ִ� ������ �޿��� 5% �λ��ϸ�?
update employee set salary=salary*1.05 where emp_no in(select distinct emp_no from customer where emp_no is not null)
--
--162. ���� ���� 2~5������ 5���� ������ 10% �����ϸ�?
--���� ���� �� �������� ���� > ���� ���� ���� > �Ի��� ���� ���� > ���� ���� ����
update employee set salary=salary*0.9 where emp_no in(
    select emp_no from (select rownum "RNUM",zxc.* from (
        select emp_no from employee order by salary desc, decode(jikup,'����',1,'����',2,'����',3,'�븮',4,'����',5,6), hire_date,
            extract(year from sysdate)-to_number(case when substr(jumin_num,7,1) in('1','2') then '19' else '20' end||substr(jumin_num,1,4)) + 1
    ) zxc where rownum <= 5 ) where rnum >=2
)
--
--163. employee�� �Ȱ��� ������ �Ȱ��� �����͸� ���� �ֵ��� ���̺� employee2 �����?
create table employee2 as select * from employee
--
--164. employee�� �Ȱ��� ������ ���� �ֵ��� ���̺� employee3�� ����� �����ʹ� ������ ���� ��������?
create table employee3 as select * from employee where 1=2
--
--
--