Развернуть гипервизор на PVE
Настроить несколько vlan 
Развернуть 4 виртуальные машинки

1. GateWay, можно использовать PFsense
2. Nginx балансер
3. Wordpress 
4. Wordpress 

Все три витруалки, должны менеджится через ansible. Для первоначальной настройки можно использовать terraform
Основная суть, что трафик заходит на GateWay - оттуда пробрасывается на nginx - а nginx проксирует её на Wordpress, т.е использует балансировщик
wordpress должен работать полностью в докере и обновляться так же через ansible.
Можно в ТЗ использовать дополнительные виртуалки, для СУБД, хранилища данных или еще чего-то.
По итогу, надо чтобы получилось развернуть полностью инфраструктуру с нуля, через anible playbook и (или) terraform


Благодарю за интересное задание!
Справился с огрехами, но все же работает:)
PVE поднимал на физическом железе.
С Terraform работал впервые, но в целом все понятно
Proxmox тоже использовал впервые. Много времени ушло на создание сети между vlan
Основную часть времени занял pfsense (Тоже риспользовал в превый раз).
Проблемы о которых знаю:
1. Перестала подниматься VM с nginx сначала перестал колонироваться диск, потом ошибка ушла, но проблема осталась.
2. Не разобрался как из вне запускать ansible-playbook. Поэтому создал VM с десктопной убунтой в PVE и уже из нее менеджерил остальные машины внутри.
3. Nginx не прогружает статику наружу если внури PVE на убунте все хорошо, то на внешнем компьтере не очень(показано на скринах).

Жду фидбек!
Спасибо!:)
