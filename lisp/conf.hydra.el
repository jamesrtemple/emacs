(defhydra hydra-window-menu (:color pink :hint nil)
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





(defhydra hydra-project (:color blue :hint nil :idle 0.4)
        "
                                                                    ╭────────────┐
    Files             Search          Buffer             Do         │ Projectile │
  ╭─────────────────────────────────────────────────────────────────┴────────────╯
    [_f_] file          [_a_] ag          [_b_] switch         [_g_] magit
    [_l_] file dwim     [_A_] grep        [_v_] show all       [_p_] commander
    [_r_] recent file   [_s_] occur       [_V_] ibuffer        [_i_] info
    [_d_] dir           [_S_] replace     [_K_] kill all
    [_o_] other         [_t_] find tag
    [_u_] test file     [_T_] make tags
    [_h_] root         
                                                                        ╭────────┐
    Other Window      Run             Cache              Do             │ Fixmee │
  ╭──────────────────────────────────────────────────╯ ╭────────────────┴────────╯
    [_F_] file          [_U_] test        [_kc_] clear         [_x_] TODO & FIXME
    [_L_] dwim          [_m_] compile     [_kk_] add current   [_X_] toggle
    [_D_] dir           [_c_] shell       [_ks_] cleanup
    [_O_] other         [_C_] command     [_kd_] remove
    [_B_] buffer
  --------------------------------------------------------------------------------
        "
        ("<tab>" hydra-master/body "back")
        ("<ESC>" nil "quit")
        ("a"   projectile-ag)
        ("A"   helm-projectile-grep)
        ("b"   projectile-switch-to-buffer)
        ("B"   projectile-switch-to-buffer-other-window)
        ("c"   projectile-run-async-shell-command-in-root)
        ("C"   projectile-run-command-in-root)
        ("d"   projectile-find-dir)
        ("D"   projectile-find-dir-other-window)
        ("f"   projectile-find-file)
        ("F"   projectile-find-file-other-window)
        ("g"   projectile-vc)
        ("h"   projectile-dired)
        ("i"   projectile-project-info)
        ("kc"  projectile-invalidate-cache)
        ("kd"  projectile-remove-known-project)
        ("kk"  projectile-cache-current-file)
        ("K"   projectile-kill-buffers)
        ("ks"  projectile-cleanup-known-projects)
        ("l"   projectile-find-file-dwim)
        ("L"   projectile-find-file-dwim-other-window)
        ("m"   projectile-compile-project)
        ("o"   projectile-find-other-file)
        ("O"   projectile-find-other-file-other-window)
        ("p"   projectile-commander)
        ("r"   projectile-recentf)
        ("s"   projectile-multi-occur)
        ("S"   projectile-replace)
        ("t"   projectile-find-tag)
        ("T"   projectile-regenerate-tags)
        ("u"   projectile-find-test-file)
        ("U"   projectile-test-project)
        ("v"   projectile-display-buffer)
        ("V"   projectile-ibuffer)
        ("X"   fixmee-mode)
        ("x"   fixmee-view-listing))

(global-set-key (kbd "s-p") 'hydra-project/body)