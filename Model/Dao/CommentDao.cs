using Model.EF;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace Model.Dao
{
    public class CommentDao
    {
        private HaNoiParkingDbContext obj = null;
        public CommentDao()
        {
            obj = new HaNoiParkingDbContext();
        }

        public bool Insert(Comment cmt)
        {
            try
            {
                obj.Comments.Add(cmt);
                return obj.SaveChanges() > 0;
            }
            catch
            {
                return false;
            }
        }

        public bool Update(Comment Comment)
        {
            try
            {
                Comment updateComment = obj.Comments.Find(Comment.CommentID);
                updateComment.Rating = Comment.Rating;
                updateComment.Title = Comment.Title;
                updateComment.Content = Comment.Content;
                updateComment.Time = DateTime.Now;
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }

        public Comment GetByCommentID(int id)
        {
            return obj.Comments.Find(id);
        }


        public bool Delete(int id)
        {
            try
            {
                var Comment = GetByCommentID(id);
                obj.Comments.Remove(Comment);
                return obj.SaveChanges() > 0;
            }
            catch
            {

                return false;
            }
        }

        public List<Comment> GetCommentPanking(int id_panking)
        {
            return obj.Comments.ToList().Where(q => q.ParkingID == id_panking).ToList();
        }
    }
}
