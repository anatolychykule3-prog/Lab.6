using Lab._6;
using System;
using System.Collections.Generic;
using System.Reflection.Metadata;
using System.Text;

namespace Lab._6
{
    
    
        // Interface for working with duplicates (for "excellent" grade)
        public interface IDuplicateHandler
        {
            void RemoveDuplicateLines();
        }

        // Class representing a single line (MyString)
        public class MyString
        {
            // Encapsulation: private field and read-only property
            private readonly string _content;
            public string Content => _content;

            public MyString(string content)
            {
                _content = content;
            }

            public int Length => _content.Length;
        }

        // Container class (TextContainer)
        public class TextContainer : IDuplicateHandler
        {
            private List<MyString> _lines = new List<MyString>();

            // Add a line to the text
            public void AddLine(string text)
            {
                _lines.Add(new MyString(text));
            }

            // Clear the entire text
            public void Clear() => _lines.Clear();

            // Get total character count
            public int GetTotalLength()
            {
                return _lines.Sum(l => l.Length);
            }

            // Interface implementation: removing duplicates using LINQ
            public void RemoveDuplicateLines()
            {
                _lines = _lines
                    .GroupBy(l => l.Content)
                    .Select(g => g.First())
                    .ToList();
            }

            // Getter for the lines list (read-only for the UI)
            public IReadOnlyList<MyString> GetLines() => _lines.AsReadOnly();
        }
   
}


