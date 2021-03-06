namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("User")]
    public partial class User
    {
        public int UserID { get; set; }

        [Required]
        [StringLength(500)]
        public string Nickname { get; set; }

        [StringLength(500)]
        public string Avatar { get; set; }

        [Required]
        [StringLength(500)]
        [EmailAddress]
        public string Email { get; set; }

        [Required]
        [StringLength(500)]
        public string Password { get; set; }
    }
}
