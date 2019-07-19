# Backup-Script
***Exemplo de script de Backup construído em shell-script***

------

Script desenvolvido para gerar backups *(no meu caso, da pasta `/home`)*, em um HD Externo.

A intenção, é fazer as cópias manualmente, ou seja, fazendo a chamada dos scripts manualmente, ou seja quando houver disponibilidade *(pode ser agendado, via cron, também)*. Por este motivo, executo uma cópia **FULL** a cada 60 dias, e **INCREMENTAL** a cada 15 dias.

Na configuração do repositório, estou separando a estrutura entre duas máquinas *(Acer e Lenovo)*.

**Estrutura da Solução:**

```
Backup-Script
├── Backups
│   ├── Full_Backup
│   │   ├── Acer
│   │   │   └── empty_file.txt
│   │   └── Lenovo
│   │       └── empty_file.txt
│   ├── Incremental_Backup
│   │   ├── Acer
│   │   │   └── empty_file.txt
│   │   └── Lenovo
│   │       └── empty_file.txt
│   ├── Logs
│   │   ├── Acer
│   │   │   └── empty_file.txt
│   │   └── Lenovo
│   │       └── empty_file.txt
│   ├── script_backup_FULL.sh
│   └── script_backup_INCREMENTAL.sh
├── LICENSE
└── README.md

10 directories, 10 files
```

