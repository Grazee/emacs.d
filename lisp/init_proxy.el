;; 设置代理
;; (setq url-gateway-method 'socks)
;; (setq socks-server '("Default server" "127.0.0.1" 1086 5))
(setq url-proxy-services
      '(("http" . "http://127.0.0.1:1087")
        ("https" . "http://127.0.0.1:1087")))

(setq url-http-proxy-basic-auth-storage
      (list (list "http://127.0.0.1:1087"
                  (cons "Input your LDAP UID !"
                        (base64-encode-string "LOGIN:PASSWORD")))))


;; 白名单
(setq url-gateway-local-host-regexp
      (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'"))

(provide 'init_proxy)
