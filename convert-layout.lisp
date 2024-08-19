;; author: Mark W. Naylor
;; file:  convert-layout.lisp
;; date:  2024-Aug-18

;; Commentary:
;; System for changing the kind of layout used by a group.

;; Code:

(in-package #:convert-layout)

(export '(convert-layout))

(defgeneric convert-layout (grp &optional builder)
  (:documentation "Take the supplied group `grp' and change its layout type. The
  `builder' is a function that creates a new group."))

;; TODO: Expand to do something specific for a supplied group type. Currently,
;; the it will only toggle between a tile group and a dynamic group.

(defmethod convert-layout ((grp stumpwm:group) &optional (builder nil))
  (select-builder grp builder))

(defun select-builder (grp builder)
  "If the builder exists, return it. Otherwise, select the builder based upon
the type of the group."
  (cond
    ((functionp builder) builder)
    ((not (string= (symbol-name (type-of grp)) "TILE-GROUP")) #'stumpwm:gnew)
    (t #'stumpwm:gnew-dynamic)))

;; ------------------------------------------------------------------------------
;; BSD 3-Clause License

;; Copyright © 2024, Mark W. Naylor
;; All rights reserved.

;; Redistribution and use in source and binary forms, with or without
;; modification, are permitted provided that the following conditions are met:

;; 1. Redistributions of source code must retain the above copyright notice, this
;;    list of conditions and the following disclaimer.

;; 2. Redistributions in binary form must reproduce the above copyright notice,
;;    this list of conditions and the following disclaimer in the documentation
;;    and/or other materials provided with the distribution.

;; 3. Neither the name of the copyright holder nor the names of its
;;    contributors may be used to endorse or promote products derived from
;;    this software without specific prior written permission.

;; THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
;; AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
;; IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
;; DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE
;; FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
;; DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR
;; SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER
;; CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY,
;; OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
;; OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

;; https://opensource.org/licenses/BSD-3-Clause
