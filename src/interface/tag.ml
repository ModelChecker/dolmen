
(* This file is free software, part of dolmen. See file "LICENSE" for more information *)

(** Interfaces for Tags.
    Tags are used to attach arbitrary information to ndoes in an ast. *)

(** Base signature for tags. *)
module type S = sig

  type 'a t
  (** Polymorphic tags *)

end

(** Minium required signature for tags to typecheck smtlib's core/base theory. *)
module type Smtlib_Base = sig

    type 'a t
    (** Polymorphic tags *)

    val rwrt : unit t
    (** A flag (i.e. unit tag), indicatgin that the tagged term/formula
        is to be considered as a rewrite rule. *)

end

(** Tags *)
module type Zf_Base = sig

  type 'a t
  (** Polymorphic tags *)

  val rwrt : unit t
  (** A flag (i.e. unit tag), indicatgin that the tagged term/formula
      is to be considered as a rewrite rule. *)

  type name
  (** A type used to specify a name for printing identifiers *)

  val name : name t
  (** A tag used to specify what to print when printing an identifier *)

  val exact : string -> name
  (** Print the identifier with this exact string. *)

  type pos
  (** A type to indicate how to print identifiers *)

  val pos : pos t
  (** A tag to specify how to print identifiers*)

  val infix : pos
  (** The tagged identifier is an infix symbol *)

  val prefix : pos
  (** The tagged identifier is a prefix symbol *)

end