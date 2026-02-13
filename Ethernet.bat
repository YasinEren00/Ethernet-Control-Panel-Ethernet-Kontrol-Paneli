@echo off
:: Renk kodu: 0 = Siyah Arka Plan, 3 = Turkuaz (Cyan) Yazi
color 03
title Ethernet Kontrol Paneli

:: Yonetici haklari kontrolu (Internet islemleri icin sarttir)
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo HATA: Lutfen bu dosyaya SAG TIKLAYIP 'Yonetici Olarak Calistir' secin!
    pause
    exit
)

:menu
cls
echo =================================
echo    ETHERNET KONTROL PANELI                                         Project By.Yasin Eren KAYI
echo =================================
echo [1] Ethernet Baglantisini KES
echo [2] Ethernet Baglantisini BAGLA
echo [3] Cikis
echo =================================
set /p secim=Seciminizi yapin (1-3): 

if %secim%==1 goto ethernetKes
if %secim%==2 goto ethernetBagla
if %secim%==3 exit

:ethernetKes
cls
echo Ethernet baglantisi kesiliyor...
:: Baglanti adin "Ethernet" oldugu icin asagidaki komut calisacaktir
netsh interface set interface "Ethernet" admin=disable
echo.
echo Islem tamamlandi. Ethernet KAPALI.
pause
goto menu

:ethernetBagla
cls
echo Ethernet baglantisi aktif ediliyor...
netsh interface set interface "Ethernet" admin=enable
echo.
echo Islem tamamlandi. Ethernet ACIK.
pause
goto menu