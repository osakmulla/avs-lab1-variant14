#!/bin/bash

mkdir -p ~/lab0
cd ~/lab0


mkdir -p victor/kitchen
mkdir -p victor/pastry
mkdir -p victor/hall
mkdir -p victor/reception
mkdir -p victor/management
mkdir -p archive
mkdir -p claude_monet


touch victor/kitchen/barinov_plan
touch victor/kitchen/max_dish
touch victor/pastry/katya_dessert
touch victor/hall/opening_tables
touch victor/hall/guest_list
touch victor/reception/reservations
touch victor/management/eleonora_order
touch victor/management/vika_schedule
touch archive/old_menu
touch claude_monet/farewell_note
touch opening_day

cat > victor/kitchen/barinov_plan <<'END'
Баринов проверяет кухню ресторана Victor
Лёва распределяет поваров по рабочим местам
Новое меню готовят к вечернему открытию
END

cat > victor/kitchen/max_dish <<'END'
Макс предлагает утку с новым соусом
Баринов разрешает приготовить пробную порцию
Блюдо подадут первым гостям ресторана Victor
END

cat > victor/pastry/katya_dessert <<'END'
Катя готовит шоколадный десерт
Украшение собирают перед самой подачей
Элеонора ждёт результат дегустации
END

cat > victor/hall/opening_tables <<'END'
Первый стол оставлен для Элеоноры
Второй стол подготовлен для Нагиева
Большой стол займёт команду ресторана
END

cat > victor/hall/guest_list <<'END'
Элеонора Андреевна прибывает к открытию
Дмитрий Нагиев приглашён на ужин
Денис выступает для гостей вечером
END

cat > victor/reception/reservations <<'END'
Столик четыре забронирован на семь часов
Столик шесть нужен постоянным гостям
Вика подтверждает каждую бронь
END

cat > victor/management/eleonora_order <<'END'
Элеонора требует закончить подготовку вовремя
Зал должен быть готов до приезда гостей
Баринов лично представляет праздничное меню
END

cat > victor/management/vika_schedule <<'END'
Утром проверить работу кухни
Днём провести собрание официантов
Вечером встретить первых гостей
END

cat > archive/old_menu <<'END'
Луковый суп из Claude Monet
Мильфей от Луи
Фирменное мясо от Баринова
END

cat > claude_monet/farewell_note <<'END'
Команда прощается с рестораном Claude Monet
Старые рецепты сохраняются в архиве
Макс обещает не забывать первую кухню
END

cat > opening_day <<'END'
Ресторан Victor открывается вечером
Баринов волнуется за новую команду
Вика проверяет последние приготовления
END


chmod 755 victor
chmod u=rwx,g=rx,o= victor/kitchen
chmod 640 victor/kitchen/barinov_plan
chmod 640 victor/kitchen/max_dish
chmod 750 victor/pastry
chmod u=rw,g=r,o= victor/pastry/katya_dessert
chmod u=rwx,g=rx,o= victor/hall
chmod 644 victor/hall/opening_tables
chmod 644 victor/hall/guest_list
chmod 750 victor/reception
chmod 640 victor/reception/reservations
chmod u=rwx,g=rx,o= victor/management
chmod 640 victor/management/eleonora_order
chmod 640 victor/management/vika_schedule
chmod u=rwx,g=rx,o= archive
chmod 644 archive/old_menu
chmod 755 claude_monet
chmod u=rw,g=r,o= claude_monet/farewell_note
chmod 644 opening_day


cp opening_day victor/management/opening_copy
cp -r claude_monet archive/claude_backup
ln -s victor/kitchen/barinov_plan victor_menu
ln -s ../hall victor/reception/hall_access
ln victor/hall/guest_list victor/hall/guest_list_copy
cat victor/kitchen/max_dish victor/pastry/katya_dessert > victor/kitchen/tasting_menu
cat victor/reception/reservations >> victor/management/vika_schedule
mv claude_monet/farewell_note victor/management/farewell_note


ls -lR | grep "^-" | grep -v "copy" | sort -k5,5nr | head -5
grep -rih . victor archive | grep -viE 'victor|баринов|стар' | sort -r | head -6
grep -rilE 'макс|кухн' victor/kitchen archive/claude_backup | wc -l
(head -1 victor/hall/guest_list; tail -1 victor/hall/guest_list; head -1 victor/hall/opening_tables; tail -1 victor/hall/opening_tables) | grep -iE 'гост|стол' | sort
grep -vi 'десерт' victor/kitchen/tasting_menu | grep -iE 'макс|блюд' | sort -r | wc -w
ls -lR | grep "^-" | grep -E '^[^ ]+ +2 ' | sort -k9,9r
ls -lR | grep "^l" | sort -k9,9 | head -1


rm victor/management/opening_copy
rm victor_menu
rm victor/reception/hall_access
rm victor/hall/guest_list_copy
rm victor/management/farewell_note
rmdir claude_monet
rm archive/old_menu
rm -r archive/claude_backup