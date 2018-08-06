(setq path-to-ctags "TAGS")

(defun create-tags (dir-name)
  "Create tags file."
  (interactive "DDirectory: ")
  (shell-command
   (format "ctags -f %s -e --exclude=.git --exclude=build --exclude=.settings --exclude=jansson --exclude=static -R %s" path-to-ctags (directory-file-name dir-name)))
  )
(global-set-key (kbd "C-S-l") 'list-tags)
