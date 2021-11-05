#include <cstdint>
#include <iostream>

class SpanC
{
    public:

    uint64_t id;
    uint64_t start;
    uint64_t end;
    uint64_t start_char;
    uint64_t end_char;
    uint64_t label;
    uint64_t kb_id;

    inline SpanC()
    {
        this -> id = 0;
        this -> start = 0;
        this -> end = 0;
        this -> start_char = 0;
        this -> end_char = 0;
        this -> label = 0;
        this -> kb_id = 0;
        std::cout << "Creating SpanC<" << this -> start << ", " << this -> end << ">" << std::endl;

    }
    //inline SpanC(uint64_t id = 0, uint64_t start = 0, uint64_t end = 0, uint64_t start_char = 0, uint64_t end_char = 0, uint64_t label = 0, uint64_t kb_id = 0)
    inline SpanC(uint64_t id, uint64_t start, uint64_t end, uint64_t start_char, uint64_t end_char, uint64_t label, uint64_t kb_id)
    {
        this -> id = id;
        this -> start = start;
        this -> end = end;
        this -> start_char = start_char;
        this -> end_char = end_char;
        this -> label = label;
        this -> kb_id = kb_id;
        std::cout << "Creating SpanC<" << this -> start << ", " << this -> end << ">" << std::endl;
    }

    ~SpanC()
    {
        std::cout << "Deleting SpanC<" << this -> start << ", " << this -> end << ">" << std::endl;
    }
};