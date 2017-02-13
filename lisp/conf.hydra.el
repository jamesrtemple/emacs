(defhydra hydra-window-menu (:color pink
				    :hint nil)
  "
_b_: split horizontal          _v_: split vertical
_s_: swap window               _d_: delete window
_u_: undo last window change   _r_: redo last window change
_m_: maximize window

_k_: move up  _j_: move down  _h_: move left  _l_: move right
"
  ("b" split-window-below)
  ("v" split-window-right)
  ("s" ace-swap-window)
  ("d" ace-delete-window)
  ("u" winner-undo)
  ("r" winner-redo)
  ("m" ace-maximize-window)
  ("k" windmove-up)
  ("j" windmove-down)
  ("h" windmove-left)
  ("l" windmove-right)
  ("q" nil "quit" :color blue))

(global-set-key (kbd "s-.") 'hydra-window-menu/body)



(defhydra yt-hydra/help (:color blue :hint nil)
  "
_f_unction: Documentation for a function
_v_ariable: Documentation for a variable
_i_nfo: info mode"
  ("f" describe-function)
  ("v" describe-variable)
  ("i" helm-info-org))
(global-set-key (kbd "<f1>") 'yt-hydra/help/body)
