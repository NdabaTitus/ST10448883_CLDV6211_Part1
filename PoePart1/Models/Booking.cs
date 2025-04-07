

namespace PoePart1.Models
{
    public class Booking
    {
        public int BookingID { get; set; }

        
        public string FirstName { get; set; }

       
        public string LastName { get; set; }

        
        public string Email { get; set; }

       
        public string MobileNumber { get; set; }

        public decimal TicketPrice { get; set; }
        public int NumberOfTickets { get; set; }

        // Foreign Keys
        public int EventID { get; set; }
        public int VenueID { get; set; }

        // Navigation Properties
        public virtual Event Event { get; set; }
        public virtual Venues Venue { get; set; }
    }
}
