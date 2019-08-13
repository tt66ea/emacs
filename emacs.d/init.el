(global-linum-mode t) ;;line num 显示行号
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default indent-tabs-mode nil)  ;;将tab转变为空格
(setq c-basic-offset 4)
(setq default-tab-width 4) ;;tab width 设置缩进以及tab键
(setq ring-bell-function 'ignore)
(set-default-font "Consolas-16")
(setq c-default-style "awk");;;设置C语言风格

(electric-pair-mode t)
(electric-layout-mode t)
(electric-indent-mode t)
;;electric pair 括号补全
(setq-default cursor-type 'bar)
(show-paren-mode t) ;;show paren 括号配对

(global-hl-line-mode t) ;;high light line 高亮当前行

(global-set-key [f6] 'gdb) ;;摁F6进入gdb调试

(global-set-key [f7] 'compile) ;;摁F7编译
(global-set-key [f8] 'shell) ;;摁F8进入shell
(dolist (charset '(kana han symbol cjk-misc bopomofo))
(set-fontset-font (frame-parameter nil 'font)
charset
(font-spec :family "Microsoft Yahei" :size 18)))
(require 'package)
(add-to-list 'package-archives 
             '("melpa" . "http://melpa.org/packages/"))
(package-initialize)
;;(add-hook 'after-init-hook 'global-company-mode)
(global-auto-complete-mode t)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("30289fa8d502f71a392f40a0941a83842152a68c54ad69e0638ef52f04777a4c" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "274fa62b00d732d093fc3f120aca1b31a6bb484492f31081c1814a858e25c72e" default)))
 '(package-selected-packages
   (quote
    (plan9-theme color-theme-solarized solarized-theme minimap markdown-preview-mode markdown-mode+ markdown-mode neotree treemacs-icons-dired treemacs auto-complete-clang auto-complete-c-headers company-irony-c-headers company-irony company-c-headers company irony dracula-theme clang-format auto-complete))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(load-theme 'dracula t)
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(add-hook'c++-mode-common-hook(lambda()))
(delete-selection-mode)
(setq make-backup-files nil)
(setq inhibit-splash-screen t)
(setq auto-save-default nil)
(display-time-mode 1) ;; 常显 
(setq display-time-24hr-format t) ;;格式 
(setq display-time-day-and-date t) ;;显示时间、星期、日期
(tool-bar-mode 0) 
(menu-bar-mode 0) 
(scroll-bar-mode 0) 
(setq neo-window-fixed-size nil)
(setq neo-window-width 20)

(defun mycompile()
  (interactive)
  (save-buffer)
  (compile (format "clang++ -target x86_64-pc-windows-gnu %S -o %S" (buffer-file-name) (concat (substring buffer-file-name 0 -4) ".exe")))
  );;clang++ -target x86_64-pc-windows-gnu name.cpp -o name.exe

(defun run()
  (interactive)
  (save-buffer)
  (shell-command "del tmp.bat")
  (shell-command "echo @echo off >> tmp.bat")
  (shell-command (format "echo %S.exe >> tmp.bat" (substring buffer-file-name 0 -4)))
  (shell-command "echo pause >> tmp.bat")
  (shell-command "echo exit >> tmp.bat")
  (shell-command "start tmp.bat")
  (shell-command "del tmp.bat")
) ; for Windows

(defun my:ac-c-header-init ()
    (require 'auto-complete-c-headers)
    (add-to-list 'ac-sources 'ac-source-c-headers)
    (add-to-list 'achead:include-directories '"C:/program Files (x86)/Dev-Cpp/MinGW64/lib/gcc/x86_64-w64-mingw32/4.9.2/include")
    (add-to-list 'achead:include-directories '"C:/Program Files (x86)/Dev-Cpp/MinGW64/lib/gcc/x86_64-w64-mingw32/4.9.2/include/c++"))
(add-hook 'c++-mode-hook 'my:ac-c-header-init)
(add-hook 'c-mode-hook 'my:ac-c-header-init)
