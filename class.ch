using Lab._6;
using System;
using System.Collections.Generic;
using System.Reflection.Metadata;
using System.Text;

namespace Lab._6
{
    
    
       
        public interface IDuplicateHandler
        {
            void RemoveDuplicateLines();
        }

       
        public class MyString
        {
           
            private readonly string _content;
            public string Content => _content;

            public MyString(string content)
            {
                _content = content;
            }

            public int Length => _content.Length;
        }

      
        public class TextContainer : IDuplicateHandler
        {
            private List<MyString> _lines = new List<MyString>();

          
            public void AddLine(string text)
            {
                _lines.Add(new MyString(text));
            }

        
            public void Clear() => _lines.Clear();

    
            public int GetTotalLength()
            {
                return _lines.Sum(l => l.Length);
            }

           
            public void RemoveDuplicateLines()
            {
                _lines = _lines
                    .GroupBy(l => l.Content)
                    .Select(g => g.First())
                    .ToList();
            }

           
            public IReadOnlyList<MyString> GetLines() => _lines.AsReadOnly();
        }
   
}


