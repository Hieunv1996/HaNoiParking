namespace Model.EF
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    using System.Data.Entity.Spatial;

    [Table("ParkingImage")]
    public partial class ParkingImage
    {
        [Key]
        public int ImageID { get; set; }

        public int ParkingID { get; set; }

        [Required]
        public string ImagePath { get; set; }
    }
}
