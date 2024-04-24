---
title: "Arch Linux"
weight: 3
---

# Documentação

link: https://wiki.archlinux.org/index.php/Installation_guide

* * *

## Instalação

Inicie o archlinux e:

- Sete o teclado

```shell
loadkeys br-abnt2
```

- Verifique se vc tem conexão de rede

```shell
ip link

ping google.com.br
```

- Caso você tenha Wi-Fi:

```shell
wifi-menu
```

> Abre um diálogo simples de escaneamento de rede, permitindo que você selecione com o teclado a rede desejada, digite a senha e pronto.

* * *

- Particionamendo do disco

>  Use o comando para iniciar o particionamento do disco

```shell
# Para listar as partições existentes
 lsblk 
fdisk -l 

# Para cira novas partições GPT, para a partição /dev/sda
cfdisk /dev/sda
```

| **Partição**                | **Tipo de partirção** | **Sugestão de tamanho** | **Ponto de montagem** |
| --------------------------- | --------------------- | ----------------------- | --------------------- |
| /dev/efi\_system\_partition | EFI system partition  | 500MB                   | /mnt/boot             |
| /dev/*swap_partition*       | Linux swap            | 2G                      | \[SWAP\]              |
| /dev/root_partition         | Linux x86-64 root (/) | O resto                 | /mnt                  |

- exemplo

![](assets/2023-01-08-12-38-17-image.png)

### Formatando o disco

- Patição de boot (não fiz isso) 

```shell
#mkfs.fat -F32 /dev/boot_partition
mkfs.fat -F32 /dev/sda1
```

- **Partição de SWAP**

```shell
# mkswap /dev/swap_partition
mkswap /dev/sda2
```

- **Partição de do filesystem**

```shell
# mkfs.ext4 /dev/root_partition
mkfs.ext4 
mount /dev/sda3 /mnt
```

* * *

## Pontos de montagem

- **Partição do filesystem**

```shell
# mount /dev/root_partition/mnt
mount /dev/sda3 /mnt

mkdir /mnt/home
mkdir /mnt/boot
mkdir /mnt/boot/efi
```

- **Partição de boot**

```shell
# mount /dev/boot_partition/mnt
mount /dev/sda1 /mnt/boot/efi
```

- **Habilitando Swap**

```shell
# swapon /dev/swap_partition
swapon  /dev/sda2
```

* * *

## instalando o arch linux

```shell
pacstrap /mnt base linux linux-firmware
```

Isso pode demorar um tempinho, vá tomar um chá

* * *

## Gerando tabela FSTAB

Vamos gerar a nossa tabela FSTAB, que vai dizer para o sistema onde estão montadas cada uma das partições, faremos isso usando este comando:

```shell
# Cria a tabela do fstab
genfstab -U -p /mnt >> /mnt/etc/fstab

# mostra o conteudo da tabela fstab
cat  /mnt/etc/fstab
```

Esse “-U” ali “no meio da turma” é para que seja usados os IDs dos discos no FSTAB, ao invés dos rótulos

* * *

## Alterando para o sistema instalado

```shell
arch-chroot /mnt
```

Uma vez logado no seu sistema (repare que o terminal mudou de aparência), tudo o que você fizer agora, ficará em definitivo no seu Arch Linux.

* * *

## Alterando a data e hora

Para alterar ajustar o fuso horario precisamos criar um link simbolivo

```shell
# ln -sf /usr/share/zoneinfo/Região/Cidade /etc/localtime

Ex:
ln -sf /usr/share/zoneinfo/America/Sao_Paulo /etc/localtime
```

- Sincronizar o relógio com as informações da BIOS

```shell
hwclock --systohc
```

- Validando

```shell
date
```

* * *

## Configurar o idioma do sistema

- Instalando o nano

```shell
pacman -S nano
```

Para alterar para português

- descomente a linha “pt_BR.UTF-8 UTF-8”

```shell
nano /etc/locale.gen
```

- Gere o arquivo

```shell
locale-gen
```

- Atualize a linguagem

```shell
echo LANG=pt_BR.UTF-8 >> /etc/locale.conf
```

- Configure o teclado

```shell
echo KEYMAP=br-abnt2 >> /etc/vconsole.conf
```

* * *

## Configurar Sistema

### Nome da maquina

- Nome da maquina (Pode ser qualquer nome)

```shell
# coloquei uni_arch
nano /etc/hostname
```

Porem vc deve adicionalos na tabela hosts

- Atualizando tabela hosts

```shell
nano /etc/hosts

# ADD
127.0.0.1      localhost.localdomain            localhost
::1            localhost.localdomain            localhost
127.0.1.1      uni_arch.localdomain                uni_arch
```

### senha do usuario root

- Digite o comando

```shell
passwd
```

senha: unisenha

* * *

### Criando usuarios

- Digite os comandos abaixo

```shell
# useradd -m -g users -G wheel nome_desejado_para_o_usuario
useradd -m -g users -G wheel uni_user
```

* * *

### Instalando pacotes uteis

- Use o comando

```shell
# pacman -S dosfstools os-prober mtools network-manager-applet networkmanager wpa_supplicant wireless_tools dialog sudo

# na vm
pacman -S dosfstools os-prober mtools  systemd-networkd, systemd-resolved iwd  sudo
```

* * *

### Adicionando usuario ao sudores

- é preciso adicionar o seu usuário dentro do arquivo “sudoers”:

```shell
nano /etc/sudoers
```

- Ao final do arquivo adicione “USER_NAME ALL=(ALL) ALL”, por exemplo:

```shell
uni_user ALL=(ALL) ALL
```

* * *

## Configurando a o GRUB - UEFI

```shell
pacman -S grub-efi-x86_64 efibootmgr
grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=arch_grub --recheck
cp /usr/share/locale/en@quot/LC_MESSAGES/grub.mo /boot/grub/locale/en.mo
```

- E por fim, vamos gerar o arquivo de configurações do Boot:

```shell
grub-mkconfig -o /boot/grub/grub.cfg
```

Chegamos ao final da instalação padrão, digite “exit” ou pressione “Ctrl+D” e use o comando “reboot” para reiniciar o computador, remova o pen drive da máquina.

* * *

# Instalando aplicações

- Xorg

```shell
pacman -Sy
pacman -S xorg-server
```

- Placa de video virtual box

```shell
pacman -S virtualbox-guest-utils virtualbox-guest-modules-arch mesa mesa-libgl
```

- Gnome

```shell
pacman -S gnome gnome-terminal nautilus gnome-tweaks gnome-control-center gnome-backgrounds adwaita-icon-theme
pacman -S firefox 
systemctl enable gdm
```

---

## Documentação

- https://diolinux.com.br/linux/arch-linux/como-instalar-arch-linux-tutorial-iniciantes.html
- [https://wiki.archlinux.org/index.php/Installation\_guide\_(Português)](https://wiki.archlinux.org/index.php/Installation_guide_%28Portugu%C3%AAs%29 "https://wiki.archlinux.org/index.php/Installation_guide_(Portugu%C3%AAs)")
- [https://wiki.archlinux.org/index.php/General\_recommendations\_(Português)](https://wiki.archlinux.org/index.php/General_recommendations_%28Portugu%C3%AAs%29 "https://wiki.archlinux.org/index.php/General_recommendations_(Portugu%C3%AAs)")
- https://wiki.archlinux.org/index.php/GRUB#Installation
