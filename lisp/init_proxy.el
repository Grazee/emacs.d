;; 设置代理
(setq url-gateway-method 'socks)
(setq socks-server '("Default server" "127.0.0.1" 1086 5))

;; 白名单
(setq url-gateway-local-host-regexp
      (concat "\\`" (regexp-opt '("localhost" "127.0.0.1")) "\\'"))

(provide 'init_proxy)
