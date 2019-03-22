





































































































































































































































#pragma once











#pragma once









#pragma once


















    







    
    


        
            
        


    
















#pragma once





















































































































































































































































































































































































































































































































































































































































































































#pragma region Input Buffer SAL 1 compatibility macros



























































































































































































































































































































































































































































































































































































































































































































































































#pragma endregion Input Buffer SAL 1 compatibility macros


































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    
    
    
    

    
    
























































































































































































































































    
    











































































































#pragma once
































































































































































































































































































































































#pragma once



#pragma pack(push, 8)










    
    
        typedef unsigned __int64  uintptr_t;
    





    
    


        typedef char* va_list;
    





    











    
    




















































    void __cdecl __va_start(va_list* , ...);

    
    



    








































    



#pragma pack(pop)



























    


    




__pragma(pack(push, 8))




    


        
    

















    




        
    



    


        
    







    
    





    









    







    





    



    



      
    







    typedef unsigned __int64 size_t;
    typedef __int64          ptrdiff_t;
    typedef __int64          intptr_t;













    typedef _Bool __vcrt_bool;




    



    



    




    
    typedef unsigned short wchar_t;



    


        
    



    













    










    


        




    







    
        
    






    void __cdecl __security_init_cookie(void);

    



        void __cdecl __security_check_cookie(  uintptr_t _StackCookie);
        __declspec(noreturn) void __cdecl __report_gsfailure(  uintptr_t _StackCookie);
    


extern uintptr_t __security_cookie;


    
    
    


__pragma(pack(pop))




__pragma(pack(push, 8))









    


        
    







    



    


        
    







    



    









    




    







    














    


        
    





    





    





    






























    typedef _Bool __crt_bool;











    




















    


        
    







    










    











        
    



    



    
        
    



















    __declspec(dllimport) void __cdecl _invalid_parameter(
          wchar_t const*,
          wchar_t const*,
          wchar_t const*,
                unsigned int,
                uintptr_t
        );


__declspec(dllimport) void __cdecl _invalid_parameter_noinfo(void);
__declspec(dllimport) __declspec(noreturn) void __cdecl _invalid_parameter_noinfo_noreturn(void);

__declspec(noreturn)
__declspec(dllimport) void __cdecl _invoke_watson(
      wchar_t const* _Expression,
      wchar_t const* _FunctionName,
      wchar_t const* _FileName,
            unsigned int _LineNo,
            uintptr_t _Reserved);


    
        

    


































    


        


    










    






        
    



    


        
    








































    







    





    


        


            
        
    













    


        



    



    
        
    





    
        
        
        
    





    
        
              
        


    





    
        
    





    
        
    







    









typedef int                           errno_t;
typedef unsigned short                wint_t;
typedef unsigned short                wctype_t;
typedef long                          __time32_t;
typedef __int64                       __time64_t;

typedef struct __crt_locale_data_public
{
      unsigned short const* _locale_pctype;
      int _locale_mb_cur_max;
               unsigned int _locale_lc_codepage;
} __crt_locale_data_public;

typedef struct __crt_locale_pointers
{
    struct __crt_locale_data*    locinfo;
    struct __crt_multibyte_data* mbcinfo;
} __crt_locale_pointers;

typedef __crt_locale_pointers* _locale_t;

typedef struct _Mbstatet
{ 
    unsigned long _Wchar;
    unsigned short _Byte, _State;
} _Mbstatet;

typedef _Mbstatet mbstate_t;










    


        typedef __time64_t time_t;
    




    



    typedef size_t rsize_t;











    























































































































































        
        
        
        
        
        
        
        
        
        
        
        

    













































































    







































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































































        
        
        
        

        

            


            


            


            


            


            


            


            


            



            



            


            


            


            


            


            


            


            


            


            


            



            



            



            


            



            




            

            




            

            




            

            




            

            




            

            




            

            




            

            




            

        












































    




__pragma(pack(pop))











#pragma once










#pragma once



__pragma(pack(push, 8))









    



    


        
    

















    















    
















    
    
       
    __declspec(noinline) __inline unsigned __int64* __cdecl __local_stdio_printf_options(void)
    {
        static unsigned __int64 _OptionsStorage;
        return &_OptionsStorage;
    }

    
    
       
    __declspec(noinline) __inline unsigned __int64* __cdecl __local_stdio_scanf_options(void)
    {
        static unsigned __int64 _OptionsStorage;
        return &_OptionsStorage;
    }
























__pragma(pack(pop))


__pragma(pack(push, 8))








    
    typedef struct _iobuf
    {
        void* _Placeholder;
    } FILE;


__declspec(dllimport) FILE* __cdecl __acrt_iob_func(unsigned _Ix);










    
    
    
    
    
    
    __declspec(dllimport) wint_t __cdecl fgetwc(
          FILE* _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl _fgetwchar(void);

    
    __declspec(dllimport) wint_t __cdecl fputwc(
             wchar_t _Character,
          FILE*   _Stream);

    
    __declspec(dllimport) wint_t __cdecl _fputwchar(
          wchar_t _Character
        );

     
    __declspec(dllimport) wint_t __cdecl getwc(
          FILE* _Stream
        );

     
    __declspec(dllimport) wint_t __cdecl getwchar(void);


    
     
    __declspec(dllimport) wchar_t* __cdecl fgetws(
          wchar_t* _Buffer,
                                  int      _BufferCount,
                               FILE*    _Stream
        );

    
    __declspec(dllimport) int __cdecl fputws(
           wchar_t const* _Buffer,
          FILE*          _Stream
        );

    
     
    __declspec(dllimport) wchar_t* __cdecl _getws_s(
          wchar_t* _Buffer,
                                  size_t   _BufferCount
        );

    

    
    __declspec(dllimport) wint_t __cdecl putwc(
             wchar_t _Character,
          FILE*   _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl putwchar(
          wchar_t _Character
        );

    
    __declspec(dllimport) int __cdecl _putws(
          wchar_t const* _Buffer
        );

    
    __declspec(dllimport) wint_t __cdecl ungetwc(
             wint_t _Character,
          FILE*  _Stream
        );

     
    __declspec(dllimport) FILE * __cdecl _wfdopen(
            int            _FileHandle,
          wchar_t const* _Mode
        );

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) FILE* __cdecl _wfopen(
          wchar_t const* _FileName,
          wchar_t const* _Mode
        );

    
    __declspec(dllimport) errno_t __cdecl _wfopen_s(
          FILE**         _Stream,
                             wchar_t const* _FileName,
                             wchar_t const* _Mode
        );

     
    __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wfreopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) FILE* __cdecl _wfreopen(
           wchar_t const* _FileName,
           wchar_t const* _Mode,
          FILE*          _OldStream
        );

    
    __declspec(dllimport) errno_t __cdecl _wfreopen_s(
          FILE**         _Stream,
                             wchar_t const* _FileName,
                             wchar_t const* _Mode,
                            FILE*          _OldStream
        );

     
    __declspec(dllimport) FILE* __cdecl _wfsopen(
          wchar_t const* _FileName,
          wchar_t const* _Mode,
            int            _ShFlag
        );

    __declspec(dllimport) void __cdecl _wperror(
          wchar_t const* _ErrorMessage
        );

    

         
        __declspec(dllimport) FILE* __cdecl _wpopen(
              wchar_t const* _Command,
              wchar_t const* _Mode
            );

    

    __declspec(dllimport) int __cdecl _wremove(
          wchar_t const* _FileName
        );

    
    

     
    __declspec(dllimport) __declspec(allocator) wchar_t* __cdecl _wtempnam(
          wchar_t const* _Directory,
          wchar_t const* _FilePrefix
        );

    

     
    
    __declspec(dllimport) errno_t __cdecl _wtmpnam_s(
          wchar_t* _Buffer,
                                  size_t   _BufferCount
        );

    

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wtmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __declspec(dllimport)  wchar_t* __cdecl _wtmpnam(  wchar_t *_Buffer);



    
    
    
    
    
    
    __declspec(dllimport) wint_t __cdecl _fgetwc_nolock(
          FILE* _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl _fputwc_nolock(
             wchar_t _Character,
          FILE*   _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl _getwc_nolock(
          FILE* _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl _putwc_nolock(
             wchar_t _Character,
          FILE*   _Stream
        );

    
    __declspec(dllimport) wint_t __cdecl _ungetwc_nolock(
             wint_t _Character,
          FILE*  _Stream
        );

    







    
    





    
    
    
    
    
    
    __declspec(dllimport) int __cdecl __stdio_common_vfwprintf(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

    
    __declspec(dllimport) int __cdecl __stdio_common_vfwprintf_s(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

    
    __declspec(dllimport) int __cdecl __stdio_common_vfwprintf_p(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

    
    __inline int __cdecl _vfwprintf_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return __stdio_common_vfwprintf((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vfwprintf(
                                FILE*          const _Stream,
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwprintf_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vfwprintf_s_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return __stdio_common_vfwprintf_s((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vfwprintf_s(
                                    FILE*          const _Stream,
                wchar_t const* const _Format,
                                          va_list              _ArgList
            )
    


        {
            return _vfwprintf_s_l(_Stream, _Format, ((void *)0), _ArgList);
        }
    

    

    
    __inline int __cdecl _vfwprintf_p_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return __stdio_common_vfwprintf_p((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl _vfwprintf_p(
                                FILE*          const _Stream,
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwprintf_p_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vwprintf_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return _vfwprintf_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vwprintf(
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwprintf_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vwprintf_s_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return _vfwprintf_s_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vwprintf_s(
                wchar_t const* const _Format,
                                          va_list              _ArgList
            )
    


        {
            return _vfwprintf_s_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        }
    

    

    
    __inline int __cdecl _vwprintf_p_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return _vfwprintf_p_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl _vwprintf_p(
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwprintf_p_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _fwprintf_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl fwprintf(
                                FILE*          const _Stream,
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwprintf_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _fwprintf_s_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_s_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl fwprintf_s(
                                    FILE*          const _Stream,
                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfwprintf_s_l(_Stream, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    
    __inline int __cdecl _fwprintf_p_l(
                                          FILE*          const _Stream,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_p_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _fwprintf_p(
                                FILE*          const _Stream,
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwprintf_p_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _wprintf_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl wprintf(
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwprintf_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _wprintf_s_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_s_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl wprintf_s(
                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfwprintf_s_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    
    __inline int __cdecl _wprintf_p_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwprintf_p_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _wprintf_p(
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwprintf_p_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    


    
    
    
    
    
    
    __declspec(dllimport) int __cdecl __stdio_common_vfwscanf(
                                            unsigned __int64 _Options,
                                         FILE*            _Stream,
            wchar_t const*   _Format,
                                        _locale_t        _Locale,
                                               va_list          _ArgList
        );

    
    __inline int __cdecl _vfwscanf_l(
          FILE*                                const _Stream,
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return __stdio_common_vfwscanf(
            (*__local_stdio_scanf_options ()),
            _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vfwscanf(
          FILE*                                const _Stream,
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwscanf_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vfwscanf_s_l(
                                FILE*          const _Stream,
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return __stdio_common_vfwscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Stream, _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vfwscanf_s(
                                    FILE*          const _Stream,
                wchar_t const* const _Format,
                                          va_list              _ArgList
            )
    


        {
            return _vfwscanf_s_l(_Stream, _Format, ((void *)0), _ArgList);
        }
    

    

    __inline int __cdecl _vwscanf_l(
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return _vfwscanf_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vwscanf(
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vfwscanf_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vwscanf_s_l(
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return _vfwscanf_s_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vwscanf_s(
                wchar_t const* const _Format,
                                          va_list              _ArgList
            )
    


        {
            return _vfwscanf_s_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
        }
    

    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _fwscanf_l(
                                         FILE*          const _Stream,
            wchar_t const* const _Format,
                                        _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwscanf_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "fwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl fwscanf(
                               FILE*          const _Stream,
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwscanf_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _fwscanf_s_l(
                                           FILE*          const _Stream,
            wchar_t const* const _Format,
                                          _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwscanf_s_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl fwscanf_s(
                                     FILE*          const _Stream,
                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfwscanf_s_l(_Stream, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_wscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _wscanf_l(
            wchar_t const* const _Format,
                                        _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwscanf_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "wscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl wscanf(
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfwscanf_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _wscanf_s_l(
            wchar_t const* const _Format,
                                          _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfwscanf_s_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl wscanf_s(
                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfwscanf_s_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    



    
    
    
    
    
    
        



    



     
    
    __declspec(dllimport) int __cdecl __stdio_common_vswprintf(
                                             unsigned __int64 _Options,
                 wchar_t*         _Buffer,
                                             size_t           _BufferCount,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    
    __declspec(dllimport) int __cdecl __stdio_common_vswprintf_s(
                                             unsigned __int64 _Options,
                     wchar_t*         _Buffer,
                                             size_t           _BufferCount,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    
    __declspec(dllimport) int __cdecl __stdio_common_vsnwprintf_s(
                                             unsigned __int64 _Options,
                 wchar_t*         _Buffer,
                                             size_t           _BufferCount,
                                             size_t           _MaxCount,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    
    __declspec(dllimport) int __cdecl __stdio_common_vswprintf_p(
                                             unsigned __int64 _Options,
                     wchar_t*         _Buffer,
                                             size_t           _BufferCount,
            wchar_t const*   _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _vsnwprintf_l(
            wchar_t*       const _Buffer,
                                                  size_t         const _BufferCount,
                 wchar_t const* const _Format,
                                              _locale_t      const _Locale,
                                                     va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf(
            (*__local_stdio_printf_options()) | (1ULL << 0),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

    #pragma warning(push)
    #pragma warning(disable: 4793)

     
    
    __inline int __cdecl _vsnwprintf_s_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                                       size_t         const _MaxCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
                                                          va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsnwprintf_s(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _MaxCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vsnwprintf_s(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                                       size_t         const _MaxCount,
                                wchar_t const* const _Format,
                                                          va_list              _ArgList
        )
    


    {
        return _vsnwprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, ((void *)0), _ArgList);
    }
    

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl _snwprintf(    wchar_t *_Buffer,   size_t _BufferCount,     wchar_t const* _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl _vsnwprintf(    wchar_t *_Buffer,   size_t _BufferCount,     wchar_t const* _Format, va_list _Args);

    #pragma warning(pop)

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _vsnwprintf(
            wchar_t*       _Buffer,
                                                  size_t         _BufferCount,
                           wchar_t const* _Format,
                                                     va_list        _ArgList
        )
    


    {
        #pragma warning(push)
        #pragma warning(disable: 4996) 
        return _vsnwprintf_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)
    }
    

    

     
    
    __inline int __cdecl _vswprintf_c_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
                                                          va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vswprintf_c(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                wchar_t const* const _Format,
                                                          va_list              _ArgList
        )
    


    {
        return _vswprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl _vswprintf_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
                                                          va_list              _ArgList
        )
    


    {
        #pragma warning(push)
        #pragma warning(disable: 4996) 
        return _vswprintf_c_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        #pragma warning(pop)
    }
    

     
    
    __inline int __cdecl __vswprintf_l(
                  wchar_t*       const _Buffer,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        return _vswprintf_l(_Buffer, (size_t)-1, _Format, _Locale, _ArgList);
    }
    

     
    
    __inline int __cdecl _vswprintf(
           wchar_t*       const _Buffer,
               wchar_t const* const _Format,
                                         va_list              _ArgList
        )
    


    {
        return _vswprintf_l(_Buffer, (size_t)-1, _Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl vswprintf(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                      wchar_t const* const _Format,
                                                          va_list              _ArgList
        )
    


    {
        return _vswprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl _vswprintf_s_l(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                  wchar_t const* const _Format,
                                               _locale_t      const _Locale,
                                                      va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf_s(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

    

         
        __inline int __cdecl vswprintf_s(
               wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                wchar_t const* const _Format,
                                                          va_list              _ArgList
            )
    


        {
            return _vswprintf_s_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        }
    

    

    

     
    
    __inline int __cdecl _vswprintf_p_l(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                  wchar_t const* const _Format,
                                               _locale_t      const _Locale,
                                                      va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf_p(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vswprintf_p(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                            wchar_t const* const _Format,
                                                      va_list              _ArgList
        )
    


    {
        return _vswprintf_p_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
    }
    

     
     
    __inline int __cdecl _vscwprintf_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf(
            (*__local_stdio_printf_options()) | (1ULL << 1),
            ((void *)0), 0, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
     
    __inline int __cdecl _vscwprintf(
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vscwprintf_l(_Format, ((void *)0), _ArgList);
    }
    

     
     
    __inline int __cdecl _vscwprintf_p_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
                                                va_list              _ArgList
        )
    


    {
        int const _Result = __stdio_common_vswprintf_p(
            (*__local_stdio_printf_options()) | (1ULL << 1),
            ((void *)0), 0, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
     
    __inline int __cdecl _vscwprintf_p(
            wchar_t const* const _Format,
                                      va_list              _ArgList
        )
    


    {
        return _vscwprintf_p_l(_Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl __swprintf_l(
                  wchar_t*       const _Buffer,
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = __vswprintf_l(_Buffer, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swprintf_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswprintf_c_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swprintf(
           wchar_t*       const _Buffer,
               wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = __vswprintf_l(_Buffer, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl swprintf(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vswprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    #pragma warning(push)
    
    
    #pragma warning(disable:4793 4996)

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "__swprintf_l_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl __swprintf_l(   wchar_t *_Buffer,     wchar_t const* _Format,   _locale_t _Locale, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vswprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl __vswprintf_l(   wchar_t *_Buffer,     wchar_t const* _Format,   _locale_t _Locale, va_list _Args);

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "swprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl _swprintf(   wchar_t *_Buffer,     wchar_t const* _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vswprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __inline   int __cdecl _vswprintf(   wchar_t *_Buffer,     wchar_t const* _Format, va_list _Args);

    #pragma warning(pop)

     
    
    __inline int __cdecl _swprintf_s_l(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                  wchar_t const* const _Format,
                                               _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswprintf_s_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

         
        __inline int __cdecl swprintf_s(
               wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vswprintf_s_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    

     
    
    __inline int __cdecl _swprintf_p_l(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                  wchar_t const* const _Format,
                                               _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswprintf_p_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swprintf_p(
           wchar_t*       const _Buffer,
                                                   size_t         const _BufferCount,
                            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vswprintf_p_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swprintf_c_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswprintf_c_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swprintf_c(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vswprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snwprintf_l(
            wchar_t*       const _Buffer,
                                                  size_t         const _BufferCount,
                 wchar_t const* const _Format,
                                              _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsnwprintf_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snwprintf(
            wchar_t*       _Buffer,
                                                  size_t         _BufferCount,
                           wchar_t const* _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsnwprintf_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snwprintf_s_l(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                                       size_t         const _MaxCount,
                      wchar_t const* const _Format,
                                                   _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsnwprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snwprintf_s(
           wchar_t*       const _Buffer,
                                                       size_t         const _BufferCount,
                                                       size_t         const _MaxCount,
                                wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsnwprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

     
    __inline int __cdecl _scwprintf_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vscwprintf_l(_Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     
    __inline int __cdecl _scwprintf(
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vscwprintf_l(_Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     
    __inline int __cdecl _scwprintf_p_l(
            wchar_t const* const _Format,
                                         _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vscwprintf_p_l(_Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     
    __inline int __cdecl _scwprintf_p(
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vscwprintf_p_l(_Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    


    
        #pragma warning(push)
        #pragma warning(disable: 4141 4412 4793 4996 6054)

        























































        #pragma warning(pop)
    

    







    
    
    
    
    
     
    __declspec(dllimport) int __cdecl __stdio_common_vswscanf(
                                            unsigned __int64 _Options,
                  wchar_t const*   _Buffer,
                                            size_t           _BufferCount,
            wchar_t const*   _Format,
                                        _locale_t        _Locale,
                                               va_list          _ArgList
        );

     
    
    __inline int __cdecl _vswscanf_l(
                                 wchar_t const* const _Buffer,
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return __stdio_common_vswscanf(
            (*__local_stdio_scanf_options ()),
            _Buffer, (size_t)-1, _Format, _Locale, _ArgList);
    }
    

     
    
    __inline int __cdecl vswscanf(
                                 wchar_t const* _Buffer,
            wchar_t const* _Format,
                                      va_list        _ArgList
        )
    


    {
        return _vswscanf_l(_Buffer, _Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl _vswscanf_s_l(
                                 wchar_t const* const _Buffer,
            wchar_t const* const _Format,
                               _locale_t      const _Locale,
                                      va_list              _ArgList
        )
    


    {
        return __stdio_common_vswscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Buffer, (size_t)-1, _Format, _Locale, _ArgList);
    }
    

    

         
        
        __inline int __cdecl vswscanf_s(
                                     wchar_t const* const _Buffer,
                wchar_t const* const _Format,
                                          va_list              _ArgList
            )
    


        {
            return _vswscanf_s_l(_Buffer, _Format, ((void *)0), _ArgList);
        }
    

    

    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _vsnwscanf_l(
                  wchar_t const* const _Buffer,
                                            size_t         const _BufferCount,
            wchar_t const* const _Format,
                                        _locale_t      const _Locale,
                                               va_list              _ArgList
        )
    


    {
        return __stdio_common_vswscanf(
            (*__local_stdio_scanf_options ()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);
    }
    

     
    
    __inline int __cdecl _vsnwscanf_s_l(
                    wchar_t const* const _Buffer,
                                              size_t         const _BufferCount,
            wchar_t const* const _Format,
                                          _locale_t      const _Locale,
                                                 va_list              _ArgList
        )
    


    {
        return __stdio_common_vswscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_swscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _swscanf_l(
                                          wchar_t const* const _Buffer,
            wchar_t const* const _Format,
                                        _locale_t            _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswscanf_l(_Buffer, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
      __declspec(deprecated("This function or variable may be unsafe. Consider using " "swscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl swscanf(
                                wchar_t const* const _Buffer,
            wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vswscanf_l(_Buffer, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _swscanf_s_l(
                                            wchar_t const* const _Buffer,
            wchar_t const* const _Format,
                                          _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vswscanf_s_l(_Buffer, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

         
        
        __inline int __cdecl swscanf_s(
                                      wchar_t const* const _Buffer,
                wchar_t const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vswscanf_s_l(_Buffer, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snwscanf_l(
                  wchar_t const* const _Buffer,
                                            size_t         const _BufferCount,
            wchar_t const* const _Format,
                                        _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsnwscanf_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snwscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snwscanf(
            wchar_t const* const _Buffer,
                                      size_t         const _BufferCount,
                wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsnwscanf_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snwscanf_s_l(
                    wchar_t const* const _Buffer,
                                              size_t         const _BufferCount,
            wchar_t const* const _Format,
                                          _locale_t      const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsnwscanf_s_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snwscanf_s(
             wchar_t const* const _Buffer,
                                       size_t         const _BufferCount,
               wchar_t const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsnwscanf_s_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    






__pragma(pack(pop))


__pragma(pack(push, 8))































    
















    
    



typedef __int64 fpos_t;





    
    __declspec(dllimport) errno_t __cdecl _get_stream_buffer_pointers(
               FILE*   _Stream,
          char*** _Base,
          char*** _Pointer,
          int**   _Count
        );


    
    
    
    
    
    

        
        __declspec(dllimport) errno_t __cdecl clearerr_s(
              FILE* _Stream
            );

        
        __declspec(dllimport) errno_t __cdecl fopen_s(
              FILE**      _Stream,
                                 char const* _FileName,
                                 char const* _Mode
            );

        
         
        __declspec(dllimport) size_t __cdecl fread_s(
                void*  _Buffer,
                                    size_t _BufferSize,
                                                                            size_t _ElementSize,
                                                                            size_t _ElementCount,
                                                                         FILE*  _Stream
            );

        
        __declspec(dllimport) errno_t __cdecl freopen_s(
              FILE**      _Stream,
                                 char const* _FileName,
                                 char const* _Mode,
                                FILE*       _OldStream
            );

         
        __declspec(dllimport) char* __cdecl gets_s(
              char*   _Buffer,
                               rsize_t _Size
            );

        
        __declspec(dllimport) errno_t __cdecl tmpfile_s(
                FILE** _Stream
            );

         
        
        __declspec(dllimport) errno_t __cdecl tmpnam_s(
              char*   _Buffer,
                               rsize_t _Size
            );

    

    __declspec(dllimport) void __cdecl clearerr(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl fclose(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _fcloseall(void);

     
    __declspec(dllimport) FILE* __cdecl _fdopen(
            int         _FileHandle,
          char const* _Mode
        );

     
    __declspec(dllimport) int __cdecl feof(
          FILE* _Stream
        );

     
    __declspec(dllimport) int __cdecl ferror(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl fflush(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl fgetc(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _fgetchar(void);

     
    
    __declspec(dllimport) int __cdecl fgetpos(
          FILE*   _Stream,
            fpos_t* _Position
        );

     
    
    __declspec(dllimport) char* __cdecl fgets(
          char* _Buffer,
                               int   _MaxCount,
                            FILE* _Stream
        );

     
    __declspec(dllimport) int __cdecl _fileno(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _flushall(void);

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "fopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) FILE* __cdecl fopen(
          char const* _FileName,
          char const* _Mode
        );


     
    
    __declspec(dllimport) int __cdecl fputc(
             int   _Character,
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _fputchar(
          int _Character
        );

     
    
    __declspec(dllimport) int __cdecl fputs(
           char const* _Buffer,
          FILE*       _Stream
        );

    
    __declspec(dllimport) size_t __cdecl fread(
          void*  _Buffer,
                                                      size_t _ElementSize,
                                                      size_t _ElementCount,
                                                   FILE*  _Stream
        );

     
      __declspec(deprecated("This function or variable may be unsafe. Consider using " "freopen_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) FILE* __cdecl freopen(
           char const* _FileName,
           char const* _Mode,
          FILE*       _Stream
        );

     
    __declspec(dllimport) FILE* __cdecl _fsopen(
          char const* _FileName,
          char const* _Mode,
            int         _ShFlag
        );

     
    
    __declspec(dllimport) int __cdecl fsetpos(
          FILE*         _Stream,
             fpos_t const* _Position
        );

     
    
    __declspec(dllimport) int __cdecl fseek(
          FILE* _Stream,
             long  _Offset,
             int   _Origin
        );

     
    
    __declspec(dllimport) int __cdecl _fseeki64(
          FILE*   _Stream,
             __int64 _Offset,
             int     _Origin
        );

     
     
    __declspec(dllimport) long __cdecl ftell(
          FILE* _Stream
        );

     
     
    __declspec(dllimport) __int64 __cdecl _ftelli64(
          FILE* _Stream
        );

    
    __declspec(dllimport) size_t __cdecl fwrite(
          void const* _Buffer,
                                                    size_t      _ElementSize,
                                                    size_t      _ElementCount,
                                                 FILE*       _Stream
        );

     
     
    __declspec(dllimport) int __cdecl getc(
          FILE* _Stream
        );

     
    __declspec(dllimport) int __cdecl getchar(void);

     
    __declspec(dllimport) int __cdecl _getmaxstdio(void);

    

     
    __declspec(dllimport) int __cdecl _getw(
          FILE* _Stream
        );

    __declspec(dllimport) void __cdecl perror(
          char const* _ErrorMessage
        );

    

         
        
        __declspec(dllimport) int __cdecl _pclose(
              FILE* _Stream
            );

         
        __declspec(dllimport) FILE* __cdecl _popen(
              char const* _Command,
              char const* _Mode
            );

    

     
    
    __declspec(dllimport) int __cdecl putc(
             int   _Character,
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl putchar(
          int _Character
        );

    
    __declspec(dllimport) int __cdecl puts(
          char const* _Buffer
        );

     
    
    __declspec(dllimport) int __cdecl _putw(
             int   _Word,
          FILE* _Stream
        );

    __declspec(dllimport) int __cdecl remove(
          char const* _FileName
        );

     
    __declspec(dllimport) int __cdecl rename(
          char const* _OldFileName,
          char const* _NewFileName
        );

    __declspec(dllimport) int __cdecl _unlink(
          char const* _FileName
        );

    

        __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_unlink" ". See online help for details."))
        __declspec(dllimport) int __cdecl unlink(
              char const* _FileName
            );

    

    __declspec(dllimport) void __cdecl rewind(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _rmtmp(void);

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "setvbuf" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) void __cdecl setbuf(
                                                      FILE* _Stream,
            char* _Buffer
        );

    
    __declspec(dllimport) int __cdecl _setmaxstdio(
          int _Maximum
        );

     
    
    __declspec(dllimport) int __cdecl setvbuf(
                               FILE*  _Stream,
            char*  _Buffer,
                                  int    _Mode,
                                  size_t _Size
        );

    




     
    __declspec(dllimport) __declspec(allocator) char* __cdecl _tempnam(
          char const* _DirectoryName,
          char const* _FilePrefix
        );

    



      __declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpfile_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __declspec(dllimport) FILE* __cdecl tmpfile(void);

    

#pragma warning(push)
#pragma warning(disable: 28726) 
__declspec(deprecated("This function or variable may be unsafe. Consider using " "tmpnam_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details.")) __declspec(dllimport)  char* __cdecl tmpnam(  char *_Buffer);
#pragma warning(pop)

     
    
    __declspec(dllimport) int __cdecl ungetc(
             int   _Character,
          FILE* _Stream
        );



    
    
    
    
    
    __declspec(dllimport) void __cdecl _lock_file(
          FILE* _Stream
        );

    __declspec(dllimport) void __cdecl _unlock_file(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl _fclose_nolock(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl _fflush_nolock(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl _fgetc_nolock(
          FILE* _Stream
        );

     
    
    __declspec(dllimport) int __cdecl _fputc_nolock(
             int   _Character,
          FILE* _Stream
        );

    
    __declspec(dllimport) size_t __cdecl _fread_nolock(
          void*  _Buffer,
                                                      size_t _ElementSize,
                                                      size_t _ElementCount,
                                                   FILE*  _Stream
        );

    
     
    __declspec(dllimport) size_t __cdecl _fread_nolock_s(
          void*  _Buffer,
                              size_t _BufferSize,
                                                                      size_t _ElementSize,
                                                                      size_t _ElementCount,
                                                                   FILE*  _Stream
        );

    
    __declspec(dllimport) int __cdecl _fseek_nolock(
          FILE* _Stream,
             long  _Offset,
             int   _Origin
        );

    
    __declspec(dllimport) int __cdecl _fseeki64_nolock(
          FILE*   _Stream,
             __int64 _Offset,
             int     _Origin
        );

     
    __declspec(dllimport) long __cdecl _ftell_nolock(
          FILE* _Stream
        );

     
    __declspec(dllimport) __int64 __cdecl _ftelli64_nolock(
          FILE* _Stream
        );

    
    __declspec(dllimport) size_t __cdecl _fwrite_nolock(
          void const* _Buffer,
                                                    size_t      _ElementSize,
                                                    size_t      _ElementCount,
                                                 FILE*       _Stream
        );

    
    __declspec(dllimport) int __cdecl _getc_nolock(
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _putc_nolock(
             int   _Character,
          FILE* _Stream
        );

    
    __declspec(dllimport) int __cdecl _ungetc_nolock(
             int   _Character,
          FILE* _Stream
        );

    
    
    
    



    


















    __declspec(dllimport) int* __cdecl __p__commode(void);

    


        
    



    
    



    
    
    
    
    
    __declspec(dllimport) int __cdecl __stdio_common_vfprintf(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

    __declspec(dllimport) int __cdecl __stdio_common_vfprintf_s(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    __declspec(dllimport) int __cdecl __stdio_common_vfprintf_p(
                                             unsigned __int64 _Options,
                                          FILE*            _Stream,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

    
    __inline int __cdecl _vfprintf_l(
           FILE*       const _Stream,
            char const* const _Format,
          _locale_t   const _Locale,
                 va_list           _ArgList
        )
    


    {
        return __stdio_common_vfprintf((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vfprintf(
                                FILE*       const _Stream,
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfprintf_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vfprintf_s_l(
           FILE*       const _Stream,
            char const* const _Format,
          _locale_t   const _Locale,
                 va_list           _ArgList
        )
    


    {
        return __stdio_common_vfprintf_s((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vfprintf_s(
                                    FILE*       const _Stream,
                char const* const _Format,
                                          va_list           _ArgList
            )
    


        {
            return _vfprintf_s_l(_Stream, _Format, ((void *)0), _ArgList);
        }
    

    

    
    __inline int __cdecl _vfprintf_p_l(
           FILE*       const _Stream,
            char const* const _Format,
          _locale_t   const _Locale,
                 va_list           _ArgList
        )
    


    {
        return __stdio_common_vfprintf_p((*__local_stdio_printf_options()), _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl _vfprintf_p(
                                FILE*       const _Stream,
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfprintf_p_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vprintf_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        return _vfprintf_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vprintf(
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfprintf_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vprintf_s_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        return _vfprintf_s_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vprintf_s(
                char const* const _Format,
                                          va_list           _ArgList
            )
    


        {
            return _vfprintf_s_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        }
    

    

    
    __inline int __cdecl _vprintf_p_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        return _vfprintf_p_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl _vprintf_p(
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfprintf_p_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _fprintf_l(
                                          FILE*       const _Stream,
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl fprintf(
                                FILE*       const _Stream,
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfprintf_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    __declspec(dllimport) int __cdecl _set_printf_count_output(
          int _Value
        );

    __declspec(dllimport) int __cdecl _get_printf_count_output(void);

    
    __inline int __cdecl _fprintf_s_l(
                                          FILE*       const _Stream,
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_s_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl fprintf_s(
                                    FILE*       const _Stream,
                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfprintf_s_l(_Stream, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    
    __inline int __cdecl _fprintf_p_l(
                                          FILE*       const _Stream,
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_p_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _fprintf_p(
                                FILE*       const _Stream,
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfprintf_p_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _printf_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl printf(
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfprintf_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _printf_s_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_s_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl printf_s(
                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfprintf_s_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    
    __inline int __cdecl _printf_p_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfprintf_p_l((__acrt_iob_func(1)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _printf_p(
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfprintf_p_l((__acrt_iob_func(1)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    


    
    
    
    
    
    __declspec(dllimport) int __cdecl __stdio_common_vfscanf(
                                            unsigned __int64 _Options,
                                         FILE*            _Stream,
            char const*      _Format,
                                        _locale_t        _Locale,
                                               va_list          _Arglist
        );

    
    __inline int __cdecl _vfscanf_l(
                                FILE*       const _Stream,
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return __stdio_common_vfscanf(
            (*__local_stdio_scanf_options ()),
            _Stream, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vfscanf(
                                FILE*       const _Stream,
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfscanf_l(_Stream, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vfscanf_s_l(
                                FILE*       const _Stream,
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return __stdio_common_vfscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Stream, _Format, _Locale, _ArgList);
    }
    


    

        
        __inline int __cdecl vfscanf_s(
                                    FILE*       const _Stream,
                char const* const _Format,
                                          va_list           _ArgList
            )
    


        {
            return _vfscanf_s_l(_Stream, _Format, ((void *)0), _ArgList);
        }
    

    

    
    __inline int __cdecl _vscanf_l(
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return _vfscanf_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vscanf(
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vfscanf_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vscanf_s_l(
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return _vfscanf_s_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
    }
    

    

        
        __inline int __cdecl vscanf_s(
                char const* const _Format,
                                          va_list           _ArgList
            )
    


        {
            return _vfscanf_s_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
        }
    

    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_fscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _fscanf_l(
                                         FILE*       const _Stream,
            char const* const _Format,
                                        _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfscanf_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "fscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl fscanf(
                               FILE*       const _Stream,
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfscanf_l(_Stream, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _fscanf_s_l(
                                           FILE*       const _Stream,
            char const* const _Format,
                                          _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfscanf_s_l(_Stream, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl fscanf_s(
                                     FILE*       const _Stream,
                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfscanf_s_l(_Stream, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_scanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _scanf_l(
            char const* const _Format,
                                        _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfscanf_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "scanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl scanf(
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vfscanf_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _scanf_s_l(
            char const* const _Format,
                                          _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vfscanf_s_l((__acrt_iob_func(0)), _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl scanf_s(
                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vfscanf_s_l((__acrt_iob_func(0)), _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    



    
    
    
    
    
     
    __declspec(dllimport) int __cdecl __stdio_common_vsprintf(
                                             unsigned __int64 _Options,
                 char*            _Buffer,
                                             size_t           _BufferCount,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    __declspec(dllimport) int __cdecl __stdio_common_vsprintf_s(
                                             unsigned __int64 _Options,
                     char*            _Buffer,
                                             size_t           _BufferCount,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    __declspec(dllimport) int __cdecl __stdio_common_vsnprintf_s(
                                             unsigned __int64 _Options,
                 char*            _Buffer,
                                             size_t           _BufferCount,
                                             size_t           _MaxCount,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
    __declspec(dllimport) int __cdecl __stdio_common_vsprintf_p(
                                             unsigned __int64 _Options,
                     char*            _Buffer,
                                             size_t           _BufferCount,
            char const*      _Format,
                                         _locale_t        _Locale,
                                                va_list          _ArgList
        );

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _vsnprintf_l(
            char*       const _Buffer,
                                                  size_t      const _BufferCount,
                 char const* const _Format,
                                              _locale_t   const _Locale,
                                                     va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf(
            (*__local_stdio_printf_options()) | (1ULL << 0),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vsnprintf(
            char*       const _Buffer,
                                                 size_t      const _BufferCount,
                          char const* const _Format,
                                                    va_list           _ArgList
        )
    


    {
        #pragma warning(push)
        #pragma warning(disable: 4996) 
        return _vsnprintf_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)
    }
    

    










     
    
    __inline int __cdecl vsnprintf(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                char const* const _Format,
                                                          va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf(
            (*__local_stdio_printf_options()) | (1ULL << 1),
            _Buffer, _BufferCount, _Format, ((void *)0), _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _vsprintf_l(
           char*       const _Buffer,
                                    char const* const _Format,
                                  _locale_t   const _Locale,
                                         va_list           _ArgList
        )
    


    {
        #pragma warning(push)
        #pragma warning(disable: 4996) 
        return _vsnprintf_l(_Buffer, (size_t)-1, _Format, _Locale, _ArgList);
        #pragma warning(pop)
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "vsprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl vsprintf(
           char*       const _Buffer,
               char const* const _Format,
                                         va_list           _ArgList
        )
    


    {
        #pragma warning(push)
        #pragma warning(disable: 4996) 
        return _vsnprintf_l(_Buffer, (size_t)-1, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)
    }
    

     
    
    __inline int __cdecl _vsprintf_s_l(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                  char const* const _Format,
                                               _locale_t   const _Locale,
                                                      va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf_s(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

    

         
        
        __inline int __cdecl vsprintf_s(
               char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                char const* const _Format,
                                                          va_list           _ArgList
            )
    


        {
            return _vsprintf_s_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        }
    

        

    

     
    
    __inline int __cdecl _vsprintf_p_l(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                  char const* const _Format,
                                               _locale_t   const _Locale,
                                                      va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf_p(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vsprintf_p(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                            char const* const _Format,
                                                      va_list           _ArgList
        )
    


    {
        return _vsprintf_p_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
    }
    

     
    
    __inline int __cdecl _vsnprintf_s_l(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                                       size_t      const _MaxCount,
                      char const* const _Format,
                                                   _locale_t   const _Locale,
                                                          va_list          _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsnprintf_s(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _MaxCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vsnprintf_s(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                                       size_t      const _MaxCount,
                                char const* const _Format,
                                                          va_list           _ArgList
        )
    


    {
        return _vsnprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, ((void *)0), _ArgList);
    }
    

    

    

         
        
        __inline int __cdecl vsnprintf_s(
               char*       const _Buffer,
                                                           size_t      const _BufferCount,
                                                           size_t      const _MaxCount,
                                    char const* const _Format,
                                                              va_list           _ArgList
            )
    


        {
            return _vsnprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, ((void *)0), _ArgList);
        }
    

        

    

    
    __inline int __cdecl _vscprintf_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf(
            (*__local_stdio_printf_options()) | (1ULL << 1),
            ((void *)0), 0, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    __inline int __cdecl _vscprintf(
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vscprintf_l(_Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vscprintf_p_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf_p(
            (*__local_stdio_printf_options()) | (1ULL << 1),
            ((void *)0), 0, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    __inline int __cdecl _vscprintf_p(
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vscprintf_p_l(_Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vsnprintf_c_l(
                   char*       const _Buffer,
                                             size_t      const _BufferCount,
            char const* const _Format,
                                         _locale_t   const _Locale,
                                                va_list           _ArgList
        )
    


    {
        int const _Result = __stdio_common_vsprintf(
            (*__local_stdio_printf_options()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        return _Result < 0 ? -1 : _Result;
    }
    

     
    
    __inline int __cdecl _vsnprintf_c(
          char*       const _Buffer,
                                    size_t      const _BufferCount,
             char const* const _Format,
                                       va_list           _ArgList
        )
    


    {
        return _vsnprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_sprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _sprintf_l(
                  char*       const _Buffer,
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsprintf_l(_Buffer, _Format, _Locale, _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl sprintf(
           char*       const _Buffer,
               char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsprintf_l(_Buffer, _Format, ((void *)0), _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    #pragma warning(push)
    #pragma warning(disable: 4996)
    #pragma warning(disable: 28719) 
    #pragma warning(disable: 28726) 
    __declspec(deprecated("This function or variable may be unsafe. Consider using " "sprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))   int __cdecl sprintf(  char *_Buffer,  char const* _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "vsprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))   int __cdecl vsprintf(  char *_Buffer,  char const* _Format, va_list _Args);
    #pragma warning(pop)

     
    
    __inline int __cdecl _sprintf_s_l(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                  char const* const _Format,
                                               _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsprintf_s_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

         
        
        __inline int __cdecl sprintf_s(
               char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));
            _Result = _vsprintf_s_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    

     
    
    __inline int __cdecl _sprintf_p_l(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                  char const* const _Format,
                                               _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsprintf_p_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _sprintf_p(
           char*       const _Buffer,
                                                   size_t      const _BufferCount,
                            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsprintf_p_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snprintf_l(
            char*       const _Buffer,
                                                  size_t      const _BufferCount,
                 char const* const _Format,
                                              _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        #pragma warning(push)
        #pragma warning(disable: 4996) 
        _Result = _vsnprintf_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        #pragma warning(pop)

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    










     
    
    __inline int __cdecl snprintf(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
    #pragma warning(suppress:28719)    
        _Result = vsnprintf(_Buffer, _BufferCount, _Format, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snprintf(
            char*       const _Buffer,
                                                  size_t      const _BufferCount,
                           char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
    #pragma warning(suppress:28719)    
        _Result = _vsnprintf(_Buffer, _BufferCount, _Format, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))    int __cdecl _snprintf(    char *_Buffer,   size_t _BufferCount,     char const* _Format, ...); __declspec(deprecated("This function or variable may be unsafe. Consider using " "_vsnprintf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))    int __cdecl _vsnprintf(    char *_Buffer,   size_t _BufferCount,     char const* _Format, va_list _Args);

     
    
    __inline int __cdecl _snprintf_c_l(
                   char*       const _Buffer,
                                             size_t      const _BufferCount,
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsnprintf_c_l(_Buffer, _BufferCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snprintf_c(
          char*       const _Buffer,
                                    size_t      const _BufferCount,
             char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsnprintf_c_l(_Buffer, _BufferCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snprintf_s_l(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                                       size_t      const _MaxCount,
                      char const* const _Format,
                                                   _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsnprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    
    __inline int __cdecl _snprintf_s(
           char*       const _Buffer,
                                                       size_t      const _BufferCount,
                                                       size_t      const _MaxCount,
                                char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsnprintf_s_l(_Buffer, _BufferCount, _MaxCount, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

    
    __inline int __cdecl _scprintf_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vscprintf_l(_Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    __inline int __cdecl _scprintf(
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vscprintf_l(_Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _scprintf_p_l(
            char const* const _Format,
                                         _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vscprintf_p_l(_Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     
    __inline int __cdecl _scprintf_p(
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vscprintf_p(_Format, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    
    
    
    
    __declspec(dllimport) int __cdecl __stdio_common_vsscanf(
                                            unsigned __int64 _Options,
                  char const*      _Buffer,
                                            size_t           _BufferCount,
            char const*      _Format,
                                        _locale_t        _Locale,
                                               va_list          _ArgList
        );

    
    __inline int __cdecl _vsscanf_l(
                                 char const* const _Buffer,
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()),
            _Buffer, (size_t)-1, _Format, _Locale, _ArgList);
    }
    

    
    __inline int __cdecl vsscanf(
                                 char const* const _Buffer,
            char const* const _Format,
                                      va_list           _ArgList
        )
    


    {
        return _vsscanf_l(_Buffer, _Format, ((void *)0), _ArgList);
    }
    

    
    __inline int __cdecl _vsscanf_s_l(
                                 char const* const _Buffer,
            char const* const _Format,
                               _locale_t   const _Locale,
                                      va_list           _ArgList
        )
    


    {
        return __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Buffer, (size_t)-1, _Format, _Locale, _ArgList);
    }
    

    

        #pragma warning(push)
        #pragma warning(disable:6530)

        
        __inline int __cdecl vsscanf_s(
                                     char const* const _Buffer,
                char const* const _Format,
                                          va_list           _ArgList
            )
    


        {
            return _vsscanf_s_l(_Buffer, _Format, ((void *)0), _ArgList);
        }
    

        

        #pragma warning(pop)

    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_sscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _sscanf_l(
                                          char const* const _Buffer,
            char const* const _Format,
                                        _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsscanf_l(_Buffer, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

      __declspec(deprecated("This function or variable may be unsafe. Consider using " "sscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl sscanf(
                                char const* const _Buffer,
            char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));
        _Result = _vsscanf_l(_Buffer, _Format, ((void *)0), _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _sscanf_s_l(
                                            char const* const _Buffer,
            char const* const _Format,
                                          _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));
        _Result = _vsscanf_s_l(_Buffer, _Format, _Locale, _ArgList);
        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    

        
        __inline int __cdecl sscanf_s(
                                      char const* const _Buffer,
                char const* const _Format,
            ...)
    


        {
            int _Result;
            va_list _ArgList;
            ((void)(__va_start(&_ArgList, _Format)));

            #pragma warning(push)
            #pragma warning(disable: 4996) 
            _Result = vsscanf_s(_Buffer, _Format, _ArgList);
            #pragma warning(pop)

            ((void)(_ArgList = (va_list)0));
            return _Result;
        }
    

    

    #pragma warning(push)
    #pragma warning(disable:6530)

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s_l" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snscanf_l(
            char const* const _Buffer,
                                            size_t      const _BufferCount,
            char const* const _Format,
                                        _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        _Result = __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

     __declspec(deprecated("This function or variable may be unsafe. Consider using " "_snscanf_s" " instead. To disable deprecation, use _CRT_SECURE_NO_WARNINGS. " "See online help for details."))
    __inline int __cdecl _snscanf(
            char const* const _Buffer,
                                            size_t      const _BufferCount,
                      char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));

        _Result = __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()),
            _Buffer, _BufferCount, _Format, ((void *)0), _ArgList);

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    


    
    __inline int __cdecl _snscanf_s_l(
              char const* const _Buffer,
                                              size_t      const _BufferCount,
            char const* const _Format,
                                          _locale_t   const _Locale,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Locale)));

        _Result = __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Buffer, _BufferCount, _Format, _Locale, _ArgList);

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    
    __inline int __cdecl _snscanf_s(
            char const* const _Buffer,
                                            size_t      const _BufferCount,
                    char const* const _Format,
        ...)
    


    {
        int _Result;
        va_list _ArgList;
        ((void)(__va_start(&_ArgList, _Format)));

        _Result = __stdio_common_vsscanf(
            (*__local_stdio_scanf_options ()) | (1ULL << 0),
            _Buffer, _BufferCount, _Format, ((void *)0), _ArgList);

        ((void)(_ArgList = (va_list)0));
        return _Result;
    }
    

    #pragma warning(pop)

    





    
    
    
    
    
    

        

        




        __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_tempnam" ". See online help for details."))
        __declspec(dllimport) char* __cdecl tempnam(
              char const* _Directory,
              char const* _FilePrefix
            );

        



         __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_fcloseall" ". See online help for details.")) __declspec(dllimport) int   __cdecl fcloseall(void);
              __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_fdopen" ". See online help for details."))    __declspec(dllimport) FILE* __cdecl fdopen(  int _FileHandle,   char const* _Format);
         __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_fgetchar" ". See online help for details."))  __declspec(dllimport) int   __cdecl fgetchar(void);
              __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_fileno" ". See online help for details."))    __declspec(dllimport) int   __cdecl fileno(  FILE* _Stream);
         __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_flushall" ". See online help for details."))  __declspec(dllimport) int   __cdecl flushall(void);
         __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_fputchar" ". See online help for details."))  __declspec(dllimport) int   __cdecl fputchar(  int _Ch);
              __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_getw" ". See online help for details."))      __declspec(dllimport) int   __cdecl getw(  FILE* _Stream);
         __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_putw" ". See online help for details."))      __declspec(dllimport) int   __cdecl putw(  int _Ch,   FILE* _Stream);
              __declspec(deprecated("The POSIX name for this item is deprecated. Instead, use the ISO C " "and C++ conformant name: " "_rmtmp" ". See online help for details."))     __declspec(dllimport) int   __cdecl rmtmp(void);

    




__pragma(pack(pop))











#pragma once





__pragma(pack(push, 8))



typedef int sig_atomic_t;

typedef void (__cdecl* _crt_signal_t)(int);
































__declspec(dllimport) void** __cdecl __pxcptinfoptrs(void);




    __declspec(dllimport) _crt_signal_t __cdecl signal(  int _Signal,   _crt_signal_t _Function);


__declspec(dllimport) int __cdecl raise(  int _Signal);



__pragma(pack(pop))











#pragma once












__pragma(pack(push, 8))


























    typedef struct __declspec(align(16)) _SETJMP_FLOAT128
    {
        unsigned __int64 Part[2];
    } SETJMP_FLOAT128;

    
    typedef SETJMP_FLOAT128 _JBTYPE;

    typedef struct _JUMP_BUFFER
    {
        unsigned __int64 Frame;
        unsigned __int64 Rbx;
        unsigned __int64 Rsp;
        unsigned __int64 Rbp;
        unsigned __int64 Rsi;
        unsigned __int64 Rdi;
        unsigned __int64 R12;
        unsigned __int64 R13;
        unsigned __int64 R14;
        unsigned __int64 R15;
        unsigned __int64 Rip;
        unsigned long MxCsr;
        unsigned short FpCsr;
        unsigned short Spare;

        SETJMP_FLOAT128 Xmm6;
        SETJMP_FLOAT128 Xmm7;
        SETJMP_FLOAT128 Xmm8;
        SETJMP_FLOAT128 Xmm9;
        SETJMP_FLOAT128 Xmm10;
        SETJMP_FLOAT128 Xmm11;
        SETJMP_FLOAT128 Xmm12;
        SETJMP_FLOAT128 Xmm13;
        SETJMP_FLOAT128 Xmm14;
        SETJMP_FLOAT128 Xmm15;
    } _JUMP_BUFFER;




























































    
    typedef _JBTYPE jmp_buf[16];





    





int __cdecl _setjmp(
      jmp_buf _Buf
    );







    __declspec(noreturn) void __cdecl longjmp(
          jmp_buf _Buf,
          int     _Value
        );



__pragma(pack(pop))


















jmp_buf ovfl_buf;




























extern double fabs(double), floor(double), log(double);
extern double pow(double,double), sqrt(double);
extern void exit(int);




typedef void (*Sig_type)(int);
double Sign(double), Random(void);
extern void BadCond(int, char*);
extern void SqXMinX(int);
extern void TstCond(int, int, char*);
extern void notify(char*);
extern int read(int, char*, int);


extern void Characteristics(void);
extern void Heading(void);
extern void History(void);
extern void Instructions(void);
extern void IsYeqX(void);
extern void NewD(void);
extern void Pause(void);
extern void PrintIfNPositive(void);
extern void SR3750(void);
extern void SR3980(void);
extern void TstPtUf(void);

Sig_type sigsave;



double Radix, BInvrse, RadixD2, BMinusU2;


double Zero = 0.0;
double Half = 0.5;
double One = 1.0;
double Two = 2.0;
double Three = 3.0;
double Four = 4.0;
double Five = 5.0;
double Eight = 8.0;
double Nine = 9.0;
double TwentySeven = 27.0;
double ThirtyTwo = 32.0;
double TwoForty = 240.0;
double MinusOne = -1.0;
double OneAndHalf = 1.5;

int NoTrials = 20; 


















typedef int Guard, Rounding, Class;
typedef char Message;


int Indx;
char ch[8];
double AInvrse, A1;
double C, CInvrse;
double D, FourD;
double E0, E1, Exp2, E3, MinSqEr;
double SqEr, MaxSqEr, E9;
double Third;
double F6, F9;
double H, HInvrse;
int I;
double StickyBit, J;
double MyZero;
double Precision;
double Q, Q9;
double R, Random9;
double T, Underflow, S;
double OneUlp, UfThold, U1, U2;
double V, V0, V9;
double W;
double X, X1, X2, X8, Random1;
double Y, Y1, Y2, Random2;
double Z, PseudoZero, Z1, Z2, Z9;
int ErrCnt[4];
int fpecount;
int Milestone;
int PageNo;
int M, N, N1;
Guard GMult, GDiv, GAddSub;
Rounding RMult, RDiv, RAddSub, RSqrt;
int Break, Done, NotMonot, Monot, Anomaly, IEEE,
		SqRWrng, UfNGrad;





 void
sigfpe(int x)
{
	fpecount++;
	printf("\n* * * FLOATING-POINT ERROR %d * * *\n", x);
	fflush((__acrt_iob_func(1)));
	if (sigsave) {

		signal(8, sigsave);

		sigsave = 0;
		longjmp(ovfl_buf, 1);
		}
	exit(1);
}

main(void)
{
	
	Zero = 0;
	One = 1;
	Two = One + One;
	Three = Two + One;
	Four = Three + One;
	Five = Four + One;
	Eight = Four + Four;
	Nine = Three * Three;
	TwentySeven = Nine * Three;
	ThirtyTwo = Four * Eight;
	TwoForty = Four * Five * Three * Four;
	MinusOne = -One;
	Half = One / Two;
	OneAndHalf = One + Half;
	ErrCnt[0] = 0;
	ErrCnt[1] = 0;
	ErrCnt[2] = 0;
	ErrCnt[3] = 0;
	PageNo = 1;
	
	Milestone = 0;
	

	signal(8, sigfpe);

	Instructions();
	Pause();
	Heading();
	Pause();
	Characteristics();
	Pause();
	History();
	Pause();
	
	Milestone = 7;
	
	printf("Program is now RUNNING tests on small integers:\n");
	
	TstCond (0, (Zero + Zero == Zero) && (One - One == Zero)
		   && (One > Zero) && (One + One == Two),
			"0+0 != 0, 1-1 != 0, 1 <= 0, or 1+1 != 2");
	Z = - Zero;
	if (Z != 0.0) {
		ErrCnt[0] = ErrCnt[0] + 1;
		printf("Comparison alleges that -0.0 is Non-zero!\n");
		U2 = 0.001;
		Radix = 1;
		TstPtUf();
		}
	TstCond (0, (Three == Two + One) && (Four == Three + One)
		   && (Four + Two * (- Two) == Zero)
		   && (Four - Three - One == Zero),
		   "3 != 2+1, 4 != 3+1, 4+2*(-2) != 0, or 4-3-1 != 0");
	TstCond (0, (MinusOne == (0 - One))
		   && (MinusOne + One == Zero ) && (One + MinusOne == Zero)
		   && (MinusOne + fabs(One) == Zero)
		   && (MinusOne + MinusOne * MinusOne == Zero),
		   "-1+1 != 0, (-1)+abs(1) != 0, or -1+(-1)*(-1) != 0");
	TstCond (0, Half + MinusOne + Half == Zero,
		  "1/2 + (-1) + 1/2 != 0");
	
	

















	Milestone = 10;
	
	TstCond (0, (Nine == Three * Three)
		   && (TwentySeven == Nine * Three) && (Eight == Four + Four)
		   && (ThirtyTwo == Eight * Four)
		   && (ThirtyTwo - TwentySeven - Four - One == Zero),
		   "9 != 3*3, 27 != 9*3, 32 != 8*4, or 32-27-4-1 != 0");
	TstCond (0, (Five == Four + One) &&
			(TwoForty == Four * Five * Three * Four)
		   && (TwoForty / Three - Four * Four * Five == Zero)
		   && ( TwoForty / Four - Five * Three * Four == Zero)
		   && ( TwoForty / Five - Four * Three * Four == Zero),
		  "5 != 4+1, 240/3 != 80, 240/4 != 60, or 240/5 != 48");
	if (ErrCnt[0] == 0) {
		printf("-1, 0, 1/2, 1, 2, 3, 4, 5, 9, 27, 32 & 240 are O.K.\n");
		printf("\n");
		}
	printf("Searching for Radix and Precision.\n");
	W = One;
	do  {
		W = W + W;
		Y = W + One;
		Z = Y - W;
		Y = Z - One;
		} while (MinusOne + fabs(Y) < Zero);
	
	Precision = Zero;
	Y = One;
	do  {
		Radix = W + Y;
		Y = Y + Y;
		Radix = Radix - W;
		} while ( Radix == Zero);
	if (Radix < Two) Radix = One;
	printf("Radix = %f .\n", Radix);
	if (Radix != 1) {
		W = One;
		do  {
			Precision = Precision + One;
			W = W * Radix;
			Y = W + One;
			} while ((Y - W) == One);
		}
	

	U1 = One / W;
	U2 = Radix * U1;
	printf("Closest relative separation found is U1 = %.7e .\n\n", U1);
	printf("Recalculating radix and precision\n ");
	
	
	E0 = Radix;
	E1 = U1;
	E9 = U2;
	E3 = Precision;
	
	X = Four / Three;
	Third = X - One;
	F6 = Half - Third;
	X = F6 + F6;
	X = fabs(X - Third);
	if (X < U2) X = U2;
	
	
	do  {
		U2 = X;
		Y = Half * U2 + ThirtyTwo * U2 * U2;
		Y = One + Y;
		X = Y - One;
		} while ( ! ((U2 <= X) || (X <= Zero)));
	
	
	X = Two / Three;
	F6 = X - Half;
	Third = F6 + F6;
	X = Third - Half;
	X = fabs(X + F6);
	if (X < U1) X = U1;
	
	
	do  {
		U1 = X;
		Y = Half * U1 + ThirtyTwo * U1 * U1;
		Y = Half - Y;
		X = Half + Y;
		Y = Half - X;
		X = Half + Y;
		} while ( ! ((U1 <= X) || (X <= Zero)));
	
	if (U1 == E1) printf("confirms closest relative separation U1 .\n");
	else printf("gets better closest relative separation U1 = %.7e .\n", U1);
	W = One / U1;
	F9 = (Half - U1) + Half;
	Radix = floor(0.01 + U2 / U1);
	if (Radix == E0) printf("Radix confirmed.\n");
	else printf("MYSTERY: recalculated Radix = %.7e .\n", Radix);
	TstCond (2, Radix <= Eight + Eight,
		   "Radix is too big: roundoff problems");
	TstCond (3, (Radix == Two) || (Radix == 10)
		   || (Radix == One), "Radix is not as good as 2 or 10");
	
	Milestone = 20;
	
	TstCond (0, F9 - Half < Half,
		   "(1-U1)-1/2 < 1/2 is FALSE, prog. fails?");
	X = F9;
	I = 1;
	Y = X - Half;
	Z = Y - Half;
	TstCond (0, (X != One)
		   || (Z == Zero), "Comparison is fuzzy,X=1 but X-1/2-1/2 != 0");
	X = One + U2;
	I = 0;
	
	Milestone = 25;
	
	
	BMinusU2 = Radix - One;
	BMinusU2 = (BMinusU2 - U2) + One;
	
	if (Radix != One)  {
		X = - TwoForty * log(U1) / log(Radix);
		Y = floor(Half + X);
		if (fabs(X - Y) * Four < One) X = Y;
		Precision = X / TwoForty;
		Y = floor(Half + Precision);
		if (fabs(Precision - Y) * TwoForty < Half) Precision = Y;
		}
	if ((Precision != floor(Precision)) || (Radix == One)) {
		printf("Precision cannot be characterized by an Integer number\n");
		printf("of significant digits but, by itself, this is a minor flaw.\n");
		}
	if (Radix == One) 
		printf("logarithmic encoding has precision characterized solely by U1.\n");
	else printf("The number of significant digits of the Radix is %f .\n",
			Precision);
	TstCond (1, U2 * Nine * Nine * TwoForty < One,
		   "Precision worse than 5 decimal figures  ");
	
	Milestone = 30;
	
	
	X = fabs(((Four / Three - One) - One / Four) * Three - One / Four);
	do  {
		Z2 = X;
		X = (One + (Half * Z2 + ThirtyTwo * Z2 * Z2)) - One;
		} while ( ! ((Z2 <= X) || (X <= Zero)));
	X = Y = Z = fabs((Three / Four - Two / Three) * Three - One / Four);
	do  {
		Z1 = Z;
		Z = (One / Two - ((One / Two - (Half * Z1 + ThirtyTwo * Z1 * Z1))
			+ One / Two)) + One / Two;
		} while ( ! ((Z1 <= Z) || (Z <= Zero)));
	do  {
		do  {
			Y1 = Y;
			Y = (Half - ((Half - (Half * Y1 + ThirtyTwo * Y1 * Y1)) + Half
				)) + Half;
			} while ( ! ((Y1 <= Y) || (Y <= Zero)));
		X1 = X;
		X = ((Half * X1 + ThirtyTwo * X1 * X1) - F9) + F9;
		} while ( ! ((X1 <= X) || (X <= Zero)));
	if ((X1 != Y1) || (X1 != Z1)) {
		BadCond(1, "Disagreements among the values X1, Y1, Z1,\n");
		printf("respectively  %.7e,  %.7e,  %.7e,\n", X1, Y1, Z1);
		printf("are symptoms of inconsistencies introduced\n");
		printf("by extra-precise evaluation of arithmetic subexpressions.\n");
		notify("Possibly some part of this");
		if ((X1 == U1) || (Y1 == U1) || (Z1 == U1))  printf(
			"That feature is not tested further by this program.\n") ;
		}
	else  {
		if ((Z1 != U1) || (Z2 != U2)) {
			if ((Z1 >= U1) || (Z2 >= U2)) {
				BadCond(0, "");
				notify("Precision");
				printf("\tU1 = %.7e, Z1 - U1 = %.7e\n",U1,Z1-U1);
				printf("\tU2 = %.7e, Z2 - U2 = %.7e\n",U2,Z2-U2);
				}
			else {
				if ((Z1 <= Zero) || (Z2 <= Zero)) {
					printf("Because of unusual Radix = %f", Radix);
					printf(", or exact rational arithmetic a result\n");
					printf("Z1 = %.7e, or Z2 = %.7e ", Z1, Z2);
					notify("of an\nextra-precision");
					}
				if (Z1 != Z2 || Z1 > Zero) {
					X = Z1 / U1;
					Y = Z2 / U2;
					if (Y > X) X = Y;
					Q = - log(X);
					printf("Some subexpressions appear to be calculated extra\n");
					printf("precisely with about %g extra B-digits, i.e.\n",
						(Q / log(Radix)));
					printf("roughly %g extra significant decimals.\n",
						Q / log(10.));
					}
				printf("That feature is not tested further by this program.\n");
				}
			}
		}
	Pause();
	
	




	Milestone = 35;
	
	if (Radix >= Two) {
		X = W / (Radix * Radix);
		Y = X + One;
		Z = Y - X;
		T = Z + U2;
		X = T - Z;
		TstCond (0, X == U2,
			"Subtraction is not normalized X=Y,X+Z != Y+Z!");
		if (X == U2) printf(
			"Subtraction appears to be normalized, as it should be.");
		}
	printf("\nChecking for guard digit in *, /, and -.\n");
	Y = F9 * One;
	Z = One * F9;
	X = F9 - Half;
	Y = (Y - Half) - X;
	Z = (Z - Half) - X;
	X = One + U2;
	T = X * Radix;
	R = Radix * X;
	X = T - Radix;
	X = X - Radix * U2;
	T = R - Radix;
	T = T - Radix * U2;
	X = X * (Radix - One);
	T = T * (Radix - One);
	if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)) GMult = 1;
	else {
		GMult = 0;
		TstCond (1, 0,
			"* lacks a Guard Digit, so 1*X != X");
		}
	Z = Radix * U2;
	X = One + Z;
	Y = fabs((X + Z) - X * X) - U2;
	X = One - U2;
	Z = fabs((X - U2) - X * X) - U1;
	TstCond (0, (Y <= Zero)
		   && (Z <= Zero), "* gets too many final digits wrong.\n");
	Y = One - U2;
	X = One + U2;
	Z = One / Y;
	Y = Z - X;
	X = One / Three;
	Z = Three / Nine;
	X = X - Z;
	T = Nine / TwentySeven;
	Z = Z - T;
	TstCond(2, X == Zero && Y == Zero && Z == Zero,
		"Division lacks a Guard Digit, so error can exceed 1 ulp\n\
or  1/3  and  3/9  and  9/27 may disagree");
	Y = F9 / One;
	X = F9 - Half;
	Y = (Y - Half) - X;
	X = One + U2;
	T = X / One;
	X = T - X;
	if ((X == Zero) && (Y == Zero) && (Z == Zero)) GDiv = 1;
	else {
		GDiv = 0;
		TstCond (1, 0,
			"Division lacks a Guard Digit, so X/1 != X");
		}
	X = One / (One + U2);
	Y = X - Half - Half;
	TstCond (1, Y < Zero,
		   "Computed value of 1/1.000..1 >= 1");
	X = One - U2;
	Y = One + Radix * U2;
	Z = X * Radix;
	T = Y * Radix;
	R = Z / Radix;
	StickyBit = T / Radix;
	X = R - X;
	Y = StickyBit - Y;
	TstCond (0, X == Zero && Y == Zero,
			"* and/or / gets too many last digits wrong");
	Y = One - U1;
	X = One - F9;
	Y = One - Y;
	T = Radix - U2;
	Z = Radix - BMinusU2;
	T = Radix - T;
	if ((X == U1) && (Y == U1) && (Z == U2) && (T == U2)) GAddSub = 1;
	else {
		GAddSub = 0;
		TstCond (1, 0,
			"- lacks Guard Digit, so cancellation is obscured");
		}
	if (F9 != One && F9 - One >= Zero) {
		BadCond(1, "comparison alleges  (1-U1) < 1  although\n");
		printf("  subtraction yields  (1-U1) - 1 = 0 , thereby vitiating\n");
		printf("  such precautions against division by zero as\n");
		printf("  ...  if (X == 1.0) {.....} else {.../(X-1.0)...}\n");
		}
	if (GMult == 1 && GDiv == 1 && GAddSub == 1) printf(
		"     *, /, and - appear to have guard digits, as they should.\n");
	
	Milestone = 40;
	
	Pause();
	printf("Checking rounding on multiply, divide and add/subtract.\n");
	RMult = 0;
	RDiv = 0;
	RAddSub = 0;
	RadixD2 = Radix / Two;
	A1 = Two;
	Done = 0;
	do  {
		AInvrse = Radix;
		do  {
			X = AInvrse;
			AInvrse = AInvrse / A1;
			} while ( ! (floor(AInvrse) != AInvrse));
		Done = (X == One) || (A1 > Three);
		if (! Done) A1 = Nine + One;
		} while ( ! (Done));
	if (X == One) A1 = Radix;
	AInvrse = One / A1;
	X = A1;
	Y = AInvrse;
	Done = 0;
	do  {
		Z = X * Y - Half;
		TstCond (0, Z == Half,
			"X * (1/X) differs from 1");
		Done = X == Radix;
		X = Radix;
		Y = One / X;
		} while ( ! (Done));
	Y2 = One + U2;
	Y1 = One - U2;
	X = OneAndHalf - U2;
	Y = OneAndHalf + U2;
	Z = (X - U2) * Y2;
	T = Y * Y1;
	Z = Z - X;
	T = T - X;
	X = X * Y2;
	Y = (Y + U2) * Y1;
	X = X - OneAndHalf;
	Y = Y - OneAndHalf;
	if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T <= Zero)) {
		X = (OneAndHalf + U2) * Y2;
		Y = OneAndHalf - U2 - U2;
		Z = OneAndHalf + U2 + U2;
		T = (OneAndHalf - U2) * Y1;
		X = X - (Z + U2);
		StickyBit = Y * Y1;
		S = Z * Y2;
		T = T - Y;
		Y = (U2 - Y) + StickyBit;
		Z = S - (Z + U2 + U2);
		StickyBit = (Y2 + U2) * Y1;
		Y1 = Y2 * Y1;
		StickyBit = StickyBit - Y2;
		Y1 = Y1 - Half;
		if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)
			&& ( StickyBit == Zero) && (Y1 == Half)) {
			RMult = 1;
			printf("Multiplication appears to round correctly.\n");
			}
		else	if ((X + U2 == Zero) && (Y < Zero) && (Z + U2 == Zero)
				&& (T < Zero) && (StickyBit + U2 == Zero)
				&& (Y1 < Half)) {
				RMult = 2;
				printf("Multiplication appears to chop.\n");
				}
			else printf("* is neither chopped nor correctly rounded.\n");
		if ((RMult == 1) && (GMult == 0)) notify("Multiplication");
		}
	else printf("* is neither chopped nor correctly rounded.\n");
	
	Milestone = 45;
	
	Y2 = One + U2;
	Y1 = One - U2;
	Z = OneAndHalf + U2 + U2;
	X = Z / Y2;
	T = OneAndHalf - U2 - U2;
	Y = (T - U2) / Y1;
	Z = (Z + U2) / Y2;
	X = X - OneAndHalf;
	Y = Y - T;
	T = T / Y1;
	Z = Z - (OneAndHalf + U2);
	T = (U2 - OneAndHalf) + T;
	if (! ((X > Zero) || (Y > Zero) || (Z > Zero) || (T > Zero))) {
		X = OneAndHalf / Y2;
		Y = OneAndHalf - U2;
		Z = OneAndHalf + U2;
		X = X - Y;
		T = OneAndHalf / Y1;
		Y = Y / Y1;
		T = T - (Z + U2);
		Y = Y - Z;
		Z = Z / Y2;
		Y1 = (Y2 + U2) / Y2;
		Z = Z - OneAndHalf;
		Y2 = Y1 - Y2;
		Y1 = (F9 - U1) / F9;
		if ((X == Zero) && (Y == Zero) && (Z == Zero) && (T == Zero)
			&& (Y2 == Zero) && (Y2 == Zero)
			&& (Y1 - Half == F9 - Half )) {
			RDiv = 1;
			printf("Division appears to round correctly.\n");
			if (GDiv == 0) notify("Division");
			}
		else if ((X < Zero) && (Y < Zero) && (Z < Zero) && (T < Zero)
			&& (Y2 < Zero) && (Y1 - Half < F9 - Half)) {
			RDiv = 2;
			printf("Division appears to chop.\n");
			}
		}
	if (RDiv == 0) printf("/ is neither chopped nor correctly rounded.\n");
	BInvrse = One / Radix;
	TstCond (0, (BInvrse * Radix - Half == Half),
		   "Radix * ( 1 / Radix ) differs from 1");
	
	




	Milestone = 50;
	
	TstCond (0, ((F9 + U1) - Half == Half)
		   && ((BMinusU2 + U2 ) - One == Radix - One),
		   "Incomplete carry-propagation in Addition");
	X = One - U1 * U1;
	Y = One + U2 * (One - U2);
	Z = F9 - Half;
	X = (X - Half) - Z;
	Y = Y - One;
	if ((X == Zero) && (Y == Zero)) {
		RAddSub = 2;
		printf("Add/Subtract appears to be chopped.\n");
		}
	if (GAddSub == 1) {
		X = (Half + U2) * U2;
		Y = (Half - U2) * U2;
		X = One + X;
		Y = One + Y;
		X = (One + U2) - X;
		Y = One - Y;
		if ((X == Zero) && (Y == Zero)) {
			X = (Half + U2) * U1;
			Y = (Half - U2) * U1;
			X = One - X;
			Y = One - Y;
			X = F9 - X;
			Y = One - Y;
			if ((X == Zero) && (Y == Zero)) {
				RAddSub = 1;
				printf("Addition/Subtraction appears to round correctly.\n");
				if (GAddSub == 0) notify("Add/Subtract");
				}
			else printf("Addition/Subtraction neither rounds nor chops.\n");
			}
		else printf("Addition/Subtraction neither rounds nor chops.\n");
		}
	else printf("Addition/Subtraction neither rounds nor chops.\n");
	S = One;
	X = One + Half * (One + Half);
	Y = (One + U2) * Half;
	Z = X - Y;
	T = Y - X;
	StickyBit = Z + T;
	if (StickyBit != Zero) {
		S = Zero;
		BadCond(3, "(X - Y) + (Y - X) is non zero!\n");
		}
	StickyBit = Zero;
	if ((GMult == 1) && (GDiv == 1) && (GAddSub == 1)
		&& (RMult == 1) && (RDiv == 1)
		&& (RAddSub == 1) && (floor(RadixD2) == RadixD2)) {
		printf("Checking for sticky bit.\n");
		X = (Half + U1) * U2;
		Y = Half * U2;
		Z = One + Y;
		T = One + X;
		if ((Z - One <= Zero) && (T - One >= U2)) {
			Z = T + Y;
			Y = Z - X;
			if ((Z - T >= U2) && (Y - T == Zero)) {
				X = (Half + U1) * U1;
				Y = Half * U1;
				Z = One - Y;
				T = One - X;
				if ((Z - One == Zero) && (T - F9 == Zero)) {
					Z = (Half - U1) * U1;
					T = F9 - Z;
					Q = F9 - Y;
					if ((T - F9 == Zero) && (F9 - U1 - Q == Zero)) {
						Z = (One + U2) * OneAndHalf;
						T = (OneAndHalf + U2) - Z + U2;
						X = One + Half / Radix;
						Y = One + Radix * U2;
						Z = X * Y;
						if (T == Zero && X + Radix * U2 - Z == Zero) {
							if (Radix != Two) {
								X = Two + U2;
								Y = X / Two;
								if ((Y - One == Zero)) StickyBit = S;
								}
							else StickyBit = S;
							}
						}
					}
				}
			}
		}
	if (StickyBit == One) printf("Sticky bit apparently used correctly.\n");
	else printf("Sticky bit used incorrectly or not at all.\n");
	TstCond (3, !(GMult == 0 || GDiv == 0 || GAddSub == 0 ||
			RMult == 0 || RDiv == 0 || RAddSub == 0),
		"lack(s) of guard digits or failure(s) to correctly round or chop\n\
(noted above) count as one flaw in the final tally below");
	
	Milestone = 60;
	
	printf("\n");
	printf("Does Multiplication commute?  ");
	printf("Testing on %d random pairs.\n", NoTrials);
	Random9 = sqrt(3.0);
	Random1 = Third;
	I = 1;
	do  {
		X = Random();
		Y = Random();
		Z9 = Y * X;
		Z = X * Y;
		Z9 = Z - Z9;
		I = I + 1;
		} while ( ! ((I > NoTrials) || (Z9 != Zero)));
	if (I == NoTrials) {
		Random1 = One + Half / Three;
		Random2 = (U2 + U1) + One;
		Z = Random1 * Random2;
		Y = Random2 * Random1;
		Z9 = (One + Half / Three) * ((U2 + U1) + One) - (One + Half /
			Three) * ((U2 + U1) + One);
		}
	if (! ((I == NoTrials) || (Z9 == Zero)))
		BadCond(2, "X * Y == Y * X trial fails.\n");
	else printf("     No failures found in %d integer pairs.\n", NoTrials);
	
	Milestone = 70;
	
	printf("\nRunning test of square root(x).\n");
	TstCond (0, (Zero == sqrt(Zero))
		   && (- Zero == sqrt(- Zero))
		   && (One == sqrt(One)), "Square root of 0.0, -0.0 or 1.0 wrong");
	MinSqEr = Zero;
	MaxSqEr = Zero;
	J = Zero;
	X = Radix;
	OneUlp = U2;
	SqXMinX (1);
	X = BInvrse;
	OneUlp = BInvrse * U1;
	SqXMinX (1);
	X = U1;
	OneUlp = U1 * U1;
	SqXMinX (1);
	if (J != Zero) Pause();
	printf("Testing if sqrt(X * X) == X for %d Integers X.\n", NoTrials);
	J = Zero;
	X = Two;
	Y = Radix;
	if ((Radix != One)) do  {
		X = Y;
		Y = Radix * Y;
		} while ( ! ((Y - X >= NoTrials)));
	OneUlp = X * U2;
	I = 1;
	while (I <= NoTrials) {
		X = X + One;
		SqXMinX (2);
		if (J > Zero) break;
		I = I + 1;
		}
	printf("Test for sqrt monotonicity.\n");
	I = - 1;
	X = BMinusU2;
	Y = Radix;
	Z = Radix + Radix * U2;
	NotMonot = 0;
	Monot = 0;
	while ( ! (NotMonot || Monot)) {
		I = I + 1;
		X = sqrt(X);
		Q = sqrt(Y);
		Z = sqrt(Z);
		if ((X > Q) || (Q > Z)) NotMonot = 1;
		else {
			Q = floor(Q + Half);
			if (!(I > 0 || Radix == Q * Q)) Monot = 1;
			else if (I > 0) {
			if (I > 1) Monot = 1;
			else {
				Y = Y * BInvrse;
				X = Y - U1;
				Z = Y + U1;
				}
			}
			else {
				Y = Q;
				X = Y - U2;
				Z = Y + U2;
				}
			}
		}
	if (Monot) printf("sqrt has passed a test for Monotonicity.\n");
	else {
		BadCond(2, "");
		printf("sqrt(X) is non-monotonic for X near %.7e .\n", Y);
		}
	
	




	Milestone = 80;
	
	MinSqEr = MinSqEr + Half;
	MaxSqEr = MaxSqEr - Half;
	Y = (sqrt(One + U2) - One) / U2;
	SqEr = (Y - One) + U2 / Eight;
	if (SqEr > MaxSqEr) MaxSqEr = SqEr;
	SqEr = Y + U2 / Eight;
	if (SqEr < MinSqEr) MinSqEr = SqEr;
	Y = ((sqrt(F9) - U2) - (One - U2)) / U1;
	SqEr = Y + U1 / Eight;
	if (SqEr > MaxSqEr) MaxSqEr = SqEr;
	SqEr = (Y + One) + U1 / Eight;
	if (SqEr < MinSqEr) MinSqEr = SqEr;
	OneUlp = U2;
	X = OneUlp;
	for( Indx = 1; Indx <= 3; ++Indx) {
		Y = sqrt((X + U1 + X) + F9);
		Y = ((Y - U2) - ((One - U2) + X)) / OneUlp;
		Z = ((U1 - X) + F9) * Half * X * X / OneUlp;
		SqEr = (Y + Half) + Z;
		if (SqEr < MinSqEr) MinSqEr = SqEr;
		SqEr = (Y - Half) + Z;
		if (SqEr > MaxSqEr) MaxSqEr = SqEr;
		if (((Indx == 1) || (Indx == 3))) 
			X = OneUlp * Sign (X) * floor(Eight / (Nine * sqrt(OneUlp)));
		else {
			OneUlp = U1;
			X = - OneUlp;
			}
		}
	
	Milestone = 85;
	
	SqRWrng = 0;
	Anomaly = 0;
	RSqrt = 0; 
	if (Radix != One) {
		printf("Testing whether sqrt is rounded or chopped.\n");
		D = floor(Half + pow(Radix,One + Precision - floor(Precision)));
	
		X = D / Radix;
		Y = D / A1;
		if ((X != floor(X)) || (Y != floor(Y))) {
			Anomaly = 1;
			}
		else {
			X = Zero;
			Z2 = X;
			Y = One;
			Y2 = Y;
			Z1 = Radix - One;
			FourD = Four * D;
			do  {
				if (Y2 > Z2) {
					Q = Radix;
					Y1 = Y;
					do  {
						X1 = fabs(Q + floor(Half - Q / Y1) * Y1);
						Q = Y1;
						Y1 = X1;
						} while ( ! (X1 <= Zero));
					if (Q <= One) {
						Z2 = Y2;
						Z = Y;
						}
					}
				Y = Y + Two;
				X = X + Eight;
				Y2 = Y2 + X;
				if (Y2 >= FourD) Y2 = Y2 - FourD;
				} while ( ! (Y >= D));
			X8 = FourD - Z2;
			Q = (X8 + Z * Z) / FourD;
			X8 = X8 / Eight;
			if (Q != floor(Q)) Anomaly = 1;
			else {
				Break = 0;
				do  {
					X = Z1 * Z;
					X = X - floor(X / Radix) * Radix;
					if (X == One) 
						Break = 1;
					else
						Z1 = Z1 - One;
					} while ( ! (Break || (Z1 <= Zero)));
				if ((Z1 <= Zero) && (! Break)) Anomaly = 1;
				else {
					if (Z1 > RadixD2) Z1 = Z1 - Radix;
					do  {
						NewD();
						} while ( ! (U2 * D >= F9));
					if (D * Radix - D != W - D) Anomaly = 1;
					else {
						Z2 = D;
						I = 0;
						Y = D + (One + Z) * Half;
						X = D + Z + Q;
						SR3750();
						Y = D + (One - Z) * Half + D;
						X = D - Z + D;
						X = X + Q + X;
						SR3750();
						NewD();
						if (D - Z2 != W - Z2) Anomaly = 1;
						else {
							Y = (D - Z2) + (Z2 + (One - Z) * Half);
							X = (D - Z2) + (Z2 - Z + Q);
							SR3750();
							Y = (One + Z) * Half;
							X = Q;
							SR3750();
							if (I == 0) Anomaly = 1;
							}
						}
					}
				}
			}
		if ((I == 0) || Anomaly) {
			BadCond(0, "Anomalous arithmetic with Integer < ");
			printf("Radix^Precision = %.7e\n", W);
			printf(" fails test whether sqrt rounds or chops.\n");
			SqRWrng = 1;
			}
		}
	if (! Anomaly) {
		if (! ((MinSqEr < Zero) || (MaxSqEr > Zero))) {
			RSqrt = 1;
			printf("Square root appears to be correctly rounded.\n");
			}
		else  {
			if ((MaxSqEr + U2 > U2 - Half) || (MinSqEr > Half)
				|| (MinSqEr + Radix < Half)) SqRWrng = 1;
			else {
				RSqrt = 2;
				printf("Square root appears to be chopped.\n");
				}
			}
		}
	if (SqRWrng) {
		printf("Square root is neither chopped nor correctly rounded.\n");
		printf("Observed errors run from %.7e ", MinSqEr - Half);
		printf("to %.7e ulps.\n", Half + MaxSqEr);
		TstCond (1, MaxSqEr - MinSqEr < Radix * Radix,
			"sqrt gets too many last digits wrong");
		}
	
	Milestone = 90;
	
	Pause();
	printf("Testing powers Z^i for small Integers Z and i.\n");
	N = 0;
	
	I = 0;
	Z = -Zero;
	M = 3;
	Break = 0;
	do  {
		X = One;
		SR3980();
		if (I <= 10) {
			I = 1023;
			SR3980();
			}
		if (Z == MinusOne) Break = 1;
		else {
			Z = MinusOne;
			
			I = - 4;
			}
		} while ( ! Break);
	PrintIfNPositive();
	N1 = N;
	N = 0;
	Z = A1;
	M = (int)floor(Two * log(W) / log(A1));
	Break = 0;
	do  {
		X = Z;
		I = 1;
		SR3980();
		if (Z == AInvrse) Break = 1;
		else Z = AInvrse;
		} while ( ! (Break));
	
		Milestone = 100;
	
	
	
	M = NoTrials;
	Z = Three;
	do  {
		X = Z;
		I = 1;
		SR3980();
		do  {
			Z = Z + Two;
			} while ( Three * floor(Z / Three) == Z );
		} while ( Z < Eight * Three );
	if (N > 0) {
		printf("Errors like this may invalidate financial calculations\n");
		printf("\tinvolving interest rates.\n");
		}
	PrintIfNPositive();
	N += N1;
	if (N == 0) printf("... no discrepancies found.\n");
	if (N > 0) Pause();
	else printf("\n");
	
	




	Milestone = 110;
	
	printf("Seeking Underflow thresholds UfThold and E0.\n");
	D = U1;
	if (Precision != floor(Precision)) {
		D = BInvrse;
		X = Precision;
		do  {
			D = D * BInvrse;
			X = X - One;
			} while ( X > Zero);
		}
	Y = One;
	Z = D;
	
	do  {
		C = Y;
		Y = Z;
		Z = Y * Y;
		} while ((Y > Z) && (Z + Z > Z));
	Y = C;
	Z = Y * D;
	do  {
		C = Y;
		Y = Z;
		Z = Y * D;
		} while ((Y > Z) && (Z + Z > Z));
	if (Radix < Two) HInvrse = Two;
	else HInvrse = Radix;
	H = One / HInvrse;
	
	CInvrse = One / C;
	E0 = C;
	Z = E0 * H;
	
	do  {
		Y = E0;
		E0 = Z;
		Z = E0 * H;
		} while ((E0 > Z) && (Z + Z > Z));
	UfThold = E0;
	E1 = Zero;
	Q = Zero;
	E9 = U2;
	S = One + E9;
	D = C * S;
	if (D <= C) {
		E9 = Radix * U2;
		S = One + E9;
		D = C * S;
		if (D <= C) {
			BadCond(0, "multiplication gets too many last digits wrong.\n");
			Underflow = E0;
			Y1 = Zero;
			PseudoZero = Z;
			Pause();
			}
		}
	else {
		Underflow = D;
		PseudoZero = Underflow * H;
		UfThold = Zero;
		do  {
			Y1 = Underflow;
			Underflow = PseudoZero;
			if (E1 + E1 <= E1) {
				Y2 = Underflow * HInvrse;
				E1 = fabs(Y1 - Y2);
				Q = Y1;
				if ((UfThold == Zero) && (Y1 != Y2)) UfThold = Y1;
				}
			PseudoZero = PseudoZero * H;
			} while ((Underflow > PseudoZero)
				&& (PseudoZero + PseudoZero > PseudoZero));
		}
	
	if (PseudoZero != Zero) {
		printf("\n");
		Z = PseudoZero;
	
	

		if (PseudoZero <= Zero) {
			BadCond(0, "Positive expressions can underflow to an\n");
			printf("allegedly negative value\n");
			printf("PseudoZero that prints out as: %g .\n", PseudoZero);
			X = - PseudoZero;
			if (X <= Zero) {
				printf("But -PseudoZero, which should be\n");
				printf("positive, isn't; it prints out as  %g .\n", X);
				}
			}
		else {
			BadCond(3, "Underflow can stick at an allegedly positive\n");
			printf("value PseudoZero that prints out as %g .\n", PseudoZero);
			}
		TstPtUf();
		}
	
	Milestone = 120;
	
	if (CInvrse * Y > CInvrse * Y1) {
		S = H * S;
		E0 = Underflow;
		}
	if (! ((E1 == Zero) || (E1 == E0))) {
		BadCond(2, "");
		if (E1 < E0) {
			printf("Products underflow at a higher");
			printf(" threshold than differences.\n");
			if (PseudoZero == Zero) 
			E0 = E1;
			}
		else {
			printf("Difference underflows at a higher");
			printf(" threshold than products.\n");
			}
		}
	printf("Smallest strictly positive number found is E0 = %g .\n", E0);
	Z = E0;
	TstPtUf();
	Underflow = E0;
	if (N == 1) Underflow = Y;
	I = 4;
	if (E1 == Zero) I = 3;
	if (UfThold == Zero) I = I - 2;
	UfNGrad = 1;
	switch (I)  {
		case	1:
		UfThold = Underflow;
		if ((CInvrse * Q) != ((CInvrse * Y) * S)) {
			UfThold = Y;
			BadCond(0, "Either accuracy deteriorates as numbers\n");
			printf("approach a threshold = %.17e\n", UfThold);;
			printf(" coming down from %.17e\n", C);
			printf(" or else multiplication gets too many last digits wrong.\n");
			}
		Pause();
		break;
	
		case	2:
		BadCond(0, "Underflow confuses Comparison, which alleges that\n");
		printf("Q == Y while denying that |Q - Y| == 0; these values\n");
		printf("print out as Q = %.17e, Y = %.17e .\n", Q, Y2);
		printf ("|Q - Y| = %.17e .\n" , fabs(Q - Y2));
		UfThold = Q;
		break;
	
		case	3:
		X = X;
		break;
	
		case	4:
		if ((Q == UfThold) && (E1 == E0)
			&& (fabs(UfThold - E1 / E9) <= E1)) {
			UfNGrad = 0;
			printf("Underflow is gradual; it incurs Absolute Error =\n");
			printf("(roundoff in UfThold) < E0.\n");
			Y = E0 * CInvrse;
			Y = Y * (OneAndHalf + U2);
			X = CInvrse * (One + U2);
			Y = Y / X;
			IEEE = (Y == E0);
			}
		}
	if (UfNGrad) {
		printf("\n");
		sigsave = sigfpe;
		if (_setjmp(ovfl_buf)) {
			printf("Underflow / UfThold failed!\n");
			R = H + H;
			}
		else R = sqrt(Underflow / UfThold);
		sigsave = 0;
		if (R <= H) {
			Z = R * UfThold;
			X = Z * (One + R * H * (One + H));
			}
		else {
			Z = UfThold;
			X = Z * (One + H * H * (One + H));
			}
		if (! ((X == Z) || (X - Z != Zero))) {
			BadCond(3, "");
			printf("X = %.17e\n\tis not equal to Z = %.17e .\n", X, Z);
			Z9 = X - Z;
			printf("yet X - Z yields %.17e .\n", Z9);
			printf("    Should this NOT signal Underflow, ");
			printf("this is a SERIOUS DEFECT\nthat causes ");
			printf("confusion when innocent statements like\n");;
			printf("    if (X == Z)  ...  else");
			printf("  ... (f(X) - f(Z)) / (X - Z) ...\n");
			printf("encounter Division by Zero although actually\n");
			sigsave = sigfpe;
			if (_setjmp(ovfl_buf)) printf("X / Z fails!\n");
			else printf("X / Z = 1 + %g .\n", (X / Z - Half) - Half);
			sigsave = 0;
			}
		}
	printf("The Underflow threshold is %.17e, %s\n", UfThold,
		   " below which");
	printf("calculation may suffer larger Relative error than ");
	printf("merely roundoff.\n");
	Y2 = U1 * U1;
	Y = Y2 * Y2;
	Y2 = Y * U1;
	if (Y2 <= UfThold) {
		if (Y > E0) {
			BadCond(2, "");
			I = 5;
			}
		else {
			BadCond(1, "");
			I = 4;
			}
		printf("Range is too narrow; U1^%d Underflows.\n", I);
		}
	
	




	Milestone = 130;
	
	Y = - floor(Half - TwoForty * log(UfThold) / log(HInvrse)) / TwoForty;
	Y2 = Y + Y;
	printf("Since underflow occurs below the threshold\n");
	printf("UfThold = (%.17e) ^ (%.17e)\nonly underflow ", HInvrse, Y);
	printf("should afflict the expression\n\t(%.17e) ^ (%.17e);\n",
		HInvrse, Y2);
	printf("actually calculating yields:");
	if (_setjmp(ovfl_buf)) {
		sigsave = 0;
		BadCond(1, "trap on underflow.\n");
		}
	else {
		sigsave = sigfpe;
		V9 = pow(HInvrse,Y2);
		sigsave = 0;
		printf(" %.17e .\n", V9);
		if (! ((V9 >= Zero) && (V9 <= (Radix + Radix + E9) * UfThold))) {
			BadCond(1, "this is not between 0 and underflow\n");
		printf("   threshold = %.17e .\n", UfThold);
		}
		else if (! (V9 > UfThold * (One + E9)))
			printf("This computed value is O.K.\n");
		else {
			BadCond(2, "this is not between 0 and underflow\n");
			printf("   threshold = %.17e .\n", UfThold);
			}
		}
	
	Milestone = 140;
	
	printf("\n");
	
	X = Zero;
	I = 2;
	Y = Two * Three;
	Q = Zero;
	N = 0;
	do  {
		Z = X;
		I = I + 1;
		Y = Y / (I + I);
		R = Y + Q;
		X = Z + R;
		Q = (Z - X) + R;
		} while(X > Z);
	Z = (OneAndHalf + One / Eight) + X / (OneAndHalf * ThirtyTwo);
	X = Z * Z;
	Exp2 = X * X;
	X = F9;
	Y = X - U1;
	printf("Testing X^((X + 1) / (X - 1)) vs. exp(2) = %.17e as X -> 1.\n",
		Exp2);
	for(I = 1;;) {
		Z = X - BInvrse;
		Z = (X + One) / (Z - (One - BInvrse));
		Q = pow(X,Z) - Exp2;
		if (fabs(Q) > TwoForty * U2) {
			N = 1;
	 		V9 = (X - BInvrse) - (One - BInvrse);
			BadCond(2, "Calculated");
			printf(" %.17e for\n", pow(X,Z));
			printf("\t(1 + (%.17e) ^ (%.17e);\n", V9, Z);
			printf("\tdiffers from correct value by %.17e .\n", Q);
			printf("\tThis much error may spoil financial\n");
			printf("\tcalculations involving tiny interest rates.\n");
			break;
			}
		else {
			Z = (Y - X) * Two + Y;
			X = Y;
			Y = Z;
			Z = One + (X - F9)*(X - F9);
			if (Z > One && I < NoTrials) I++;
			else  {
				if (X > One) {
					if (N == 0)
					   printf("Accuracy seems adequate.\n");
					break;
					}
				else {
					X = One + U2;
					Y = U2 + U2;
					Y += X;
					I = 1;
					}
				}
			}
		}
	
	Milestone = 150;
	
	printf("Testing powers Z^Q at four nearly extreme values.\n");
	N = 0;
	Z = A1;
	Q = floor(Half - log(C) / log(A1));
	Break = 0;
	do  {
		X = CInvrse;
		Y = pow(Z,Q);
		IsYeqX();
		Q = - Q;
		X = C;
		Y = pow(Z,Q);
		IsYeqX();
		if (Z < One) Break = 1;
		else Z = AInvrse;
		} while ( ! (Break));
	PrintIfNPositive();
	if (N == 0) printf(" ... no discrepancies found.\n");
	printf("\n");
	
	
	Milestone = 160;
	
	Pause();
	printf("Searching for Overflow threshold:\n");
	printf("This may generate an error.\n");
	Y = - CInvrse;
	V9 = HInvrse * Y;
	sigsave = sigfpe;
	if (_setjmp(ovfl_buf)) { I = 0; V9 = Y; goto overflow; }
	do {
		V = Y;
		Y = V9;
		V9 = HInvrse * Y;
		} while(V9 < Y);
	I = 1;
overflow:
	sigsave = 0;
	Z = V9;
	printf("Can `Z = -Y' overflow?\n");
	printf("Trying it on Y = %.17e .\n", Y);
	V9 = - Y;
	V0 = V9;
	if (V - Y == V + V0) printf("Seems O.K.\n");
	else {
		printf("finds a ");
		BadCond(3, "-(-Y) differs from Y.\n");
		}
	if (Z != Y) {
		BadCond(1, "");
		printf("overflow past %.17e\n\tshrinks to %.17e .\n", Y, Z);
		}
	if (I) {
		Y = V * (HInvrse * U2 - HInvrse);
		Z = Y + ((One - HInvrse) * U2) * V;
		if (Z < V0) Y = Z;
		if (Y < V0) V = Y;
		if (V0 - V < V0) V = V0;
		}
	else {
		V = Y * (HInvrse * U2 - HInvrse);
		V = V + ((One - HInvrse) * U2) * Y;
		}
	printf("Overflow threshold is V  = %.17e .\n", V);
	if (I) printf("Overflow saturates at V0 = %.17e .\n", V0);
	else printf("There is no saturation value because \
the system traps on overflow.\n");
	V9 = V * One;
	printf("No Overflow should be signaled for V * 1 = %.17e\n", V9);
	V9 = V / One;
	printf("                           nor for V / 1 = %.17e .\n", V9);
	printf("Any overflow signal separating this * from the one\n");
	printf("above is a DEFECT.\n");
	
	Milestone = 170;
	
	if (!(-V < V && -V0 < V0 && -UfThold < V && UfThold < V)) {
		BadCond(0, "Comparisons involving ");
		printf("+-%g, +-%g\nand +-%g are confused by Overflow.",
			V, V0, UfThold);
		}
	
	Milestone = 175;
	
	printf("\n");
	for(Indx = 1; Indx <= 3; ++Indx) {
		switch (Indx)  {
			case 1: Z = UfThold; break;
			case 2: Z = E0; break;
			case 3: Z = PseudoZero; break;
			}
		if (Z != Zero) {
			V9 = sqrt(Z);
			Y = V9 * V9;
			if (Y / (One - Radix * E9) < Z
			   || Y > (One + Radix * E9) * Z) { 
				if (V9 > U1) BadCond(1, "");
				else BadCond(2, "");
				printf("Comparison alleges that what prints as Z = %.17e\n", Z);
				printf(" is too far from sqrt(Z) ^ 2 = %.17e .\n", Y);
				}
			}
		}
	
	Milestone = 180;
	
	for(Indx = 1; Indx <= 2; ++Indx) {
		if (Indx == 1) Z = V;
		else Z = V0;
		V9 = sqrt(Z);
		X = (One - Radix * E9) * V9;
		V9 = V9 * X;
		if (((V9 < (One - Two * Radix * E9) * Z) || (V9 > Z))) {
			Y = V9;
			if (X < W) BadCond(1, "");
			else BadCond(2, "");
			printf("Comparison alleges that Z = %17e\n", Z);
			printf(" is too far from sqrt(Z) ^ 2 (%.17e) .\n", Y);
			}
		}
	
	




	Milestone = 190;
	
	Pause();
	X = UfThold * V;
	Y = Radix * Radix;
	if (X*Y < One || X > Y) {
		if (X * Y < U1 || X > Y/U1) BadCond(2, "Badly");
		else BadCond(3, "");
			
		printf(" unbalanced range; UfThold * V = %.17e\n\t%s\n",
			X, "is too far from 1.\n");
		}
	
	Milestone = 200;
	
	for (Indx = 1; Indx <= 5; ++Indx)  {
		X = F9;
		switch (Indx)  {
			case 2: X = One + U2; break;
			case 3: X = V; break;
			case 4: X = UfThold; break;
			case 5: X = Radix;
			}
		Y = X;
		sigsave = sigfpe;
		if (_setjmp(ovfl_buf))
			printf("  X / X  traps when X = %g\n", X);
		else {
			V9 = (Y / X - Half) - Half;
			if (V9 == Zero) continue;
			if (V9 == - U1 && Indx < 5) BadCond(3, "");
			else BadCond(1, "");
			printf("  X / X differs from 1 when X = %.17e\n", X);
			printf("  instead, X / X - 1/2 - 1/2 = %.17e .\n", V9);
			}
		sigsave = 0;
		}
	
	Milestone = 210;
	
	MyZero = Zero;
	printf("\n");
	printf("What message and/or values does Division by Zero produce?\n") ;

	printf("This can interupt your program.  You can ");
	printf("skip this part if you wish.\n");
	printf("Do you wish to compute 1 / 0? ");
	fflush((__acrt_iob_func(1)));
	read (0, ch, 8);
	if ((ch[0] == 'Y') || (ch[0] == 'y')) {

		sigsave = sigfpe;
		printf("    Trying to compute 1 / 0 produces ...");
		if (!_setjmp(ovfl_buf)) printf("  %.7e .\n", One / MyZero);
		sigsave = 0;

		}
	else printf("O.K.\n");
	printf("\nDo you wish to compute 0 / 0? ");
	fflush((__acrt_iob_func(1)));
	read (0, ch, 80);
	if ((ch[0] == 'Y') || (ch[0] == 'y')) {

		sigsave = sigfpe;
		printf("\n    Trying to compute 0 / 0 produces ...");
		if (!_setjmp(ovfl_buf)) printf("  %.7e .\n", Zero / MyZero);
		sigsave = 0;

		}
	else printf("O.K.\n");

	
	Milestone = 220;
	
	Pause();
	printf("\n");
	{
		static char *msg[] = {
			"FAILUREs  encountered =",
			"SERIOUS DEFECTs  discovered =",
			"DEFECTs  discovered =",
			"FLAWs  discovered =" };
		int i;
		for(i = 0; i < 4; i++) if (ErrCnt[i])
			printf("The number of  %-29s %d.\n",
				msg[i], ErrCnt[i]);
		}
	printf("\n");
	if ((ErrCnt[0] + ErrCnt[1] + ErrCnt[2]
			+ ErrCnt[3]) > 0) {
		if ((ErrCnt[0] + ErrCnt[1] + ErrCnt[
			2] == 0) && (ErrCnt[3] > 0)) {
			printf("The arithmetic diagnosed seems ");
			printf("Satisfactory though flawed.\n");
			}
		if ((ErrCnt[0] + ErrCnt[1] == 0)
			&& ( ErrCnt[2] > 0)) {
			printf("The arithmetic diagnosed may be Acceptable\n");
			printf("despite inconvenient Defects.\n");
			}
		if ((ErrCnt[0] + ErrCnt[1]) > 0) {
			printf("The arithmetic diagnosed has ");
			printf("unacceptable Serious Defects.\n");
			}
		if (ErrCnt[0] > 0) {
			printf("Potentially fatal FAILURE may have spoiled this");
			printf(" program's subsequent diagnoses.\n");
			}
		}
	else {
		printf("No failures, defects nor flaws have been discovered.\n");
		if (! ((RMult == 1) && (RDiv == 1)
			&& (RAddSub == 1) && (RSqrt == 1))) 
			printf("The arithmetic diagnosed seems Satisfactory.\n");
		else {
			if (StickyBit >= One &&
				(Radix - Two) * (Radix - Nine - One) == Zero) {
				printf("Rounding appears to conform to ");
				printf("the proposed IEEE standard P");
				if ((Radix == Two) &&
					 ((Precision - Four * Three * Two) *
					  ( Precision - TwentySeven -
					   TwentySeven + One) == Zero)) 
					printf("754");
				else printf("854");
				if (IEEE) printf(".\n");
				else {
					printf(",\nexcept for possibly Double Rounding");
					printf(" during Gradual Underflow.\n");
					}
				}
			printf("The arithmetic diagnosed appears to be Excellent!\n");
			}
		}
	if (fpecount)
		printf("\nA total of %d floating point exceptions were registered.\n",
			fpecount);
	printf("END OF TEST.\n");
	return 0;
	}





 double
Sign (double X)



{ return X >= 0. ? 1.0 : -1.0; }

 void
Pause(void)
{

	char ch[8];

	printf("\nTo continue, press RETURN");
	fflush((__acrt_iob_func(1)));
	read(0, ch, 8);

	printf("\nDiagnosis resumes after milestone Number %d", Milestone);
	printf("          Page: %d\n\n", PageNo);
	++Milestone;
	++PageNo;
	}

 void
TstCond (int K, int Valid, char * T)




{ if (! Valid) { BadCond(K,T); printf(".\n"); } }

 void
BadCond(int K, char * T)




{
	static char *msg[] = { "FAILURE", "SERIOUS DEFECT", "DEFECT", "FLAW" };

	ErrCnt [K] = ErrCnt [K] + 1;
	printf("%s:  %s", msg[K], T);
	}


 double
Random(void)





{
	double X, Y;
	
	X = Random1 + Random9;
	Y = X * X;
	Y = Y * Y;
	X = X * Y;
	Y = X - floor(X);
	Random1 = Y + X * 0.000005;
	return(Random1);
	}

 void
SqXMinX (int ErrKind)



{
	double XA, XB;
	
	XB = X * BInvrse;
	XA = X - XB;
	SqEr = ((sqrt(X * X) - XB) - XA) / OneUlp;
	if (SqEr != Zero) {
		if (SqEr < MinSqEr) MinSqEr = SqEr;
		if (SqEr > MaxSqEr) MaxSqEr = SqEr;
		J = J + 1.0;
		BadCond(ErrKind, "\n");
		printf("sqrt( %.17e) - %.17e  = %.17e\n", X * X, X, OneUlp * SqEr);
		printf("\tinstead of correct value 0 .\n");
		}
	}

 void
NewD(void)
{
	X = Z1 * Q;
	X = floor(Half - X / Radix) * Radix + X;
	Q = (Q - X * Z) / Radix + X * X * (D / Radix);
	Z = Z - Two * X * D;
	if (Z <= Zero) {
		Z = - Z;
		Z1 = - Z1;
		}
	D = Radix * D;
	}

 void
SR3750(void)
{
	if (! ((X - Radix < Z2 - Radix) || (X - Z2 > W - Z2))) {
		I = I + 1;
		X2 = sqrt(X * D);
		Y2 = (X2 - Z2) - (Y - Z2);
		X2 = X8 / (Y - Half);
		X2 = X2 - Half * X2 * X2;
		SqEr = (Y2 + Half) + (Half - X2);
		if (SqEr < MinSqEr) MinSqEr = SqEr;
		SqEr = Y2 - X2;
		if (SqEr > MaxSqEr) MaxSqEr = SqEr;
		}
	}

 void
IsYeqX(void)
{
	if (Y != X) {
		if (N <= 0) {
			if (Z == Zero && Q <= Zero)
				printf("WARNING:  computing\n");
			else BadCond(2, "computing\n");
			printf("\t(%.17e) ^ (%.17e)\n", Z, Q);
			printf("\tyielded %.17e;\n", Y);
			printf("\twhich compared unequal to correct %.17e ;\n",
				X);
			printf("\t\tthey differ by %.17e .\n", Y - X);
			}
		N = N + 1; 
		}
	}

 void
SR3980(void)
{
	do {
		Q = (double) I;
		Y = pow(Z,Q);
		IsYeqX();
		if (++I > M) break;
		X = Z * X;
		} while ( X < W );
	}

 void
PrintIfNPositive(void)
{
	if (N > 0) printf("Similar discrepancies have occurred %d times.\n", N);
	}

 void
TstPtUf(void)
{
	N = 0;
	if (Z != Zero) {
		printf("Since comparison denies Z = 0, evaluating ");
		printf("(Z + Z) / Z should be safe.\n");
		sigsave = sigfpe;
		if (_setjmp(ovfl_buf)) goto very_serious;
		Q9 = (Z + Z) / Z;
		printf("What the machine gets for (Z + Z) / Z is  %.17e .\n",
			Q9);
		if (fabs(Q9 - Two) < Radix * U2) {
			printf("This is O.K., provided Over/Underflow");
			printf(" has NOT just been signaled.\n");
			}
		else {
			if ((Q9 < One) || (Q9 > Two)) {
very_serious:
				N = 1;
				ErrCnt [1] = ErrCnt [1] + 1;
				printf("This is a VERY SERIOUS DEFECT!\n");
				}
			else {
				N = 1;
				ErrCnt [2] = ErrCnt [2] + 1;
				printf("This is a DEFECT!\n");
				}
			}
		sigsave = 0;
		V9 = Z * One;
		Random1 = V9;
		V9 = One * Z;
		Random2 = V9;
		V9 = Z / One;
		if ((Z == Random1) && (Z == Random2) && (Z == V9)) {
			if (N > 0) Pause();
			}
		else {
			N = 1;
			BadCond(2, "What prints as Z = ");
			printf("%.17e\n\tcompares different from  ", Z);
			if (Z != Random1) printf("Z * 1 = %.17e ", Random1);
			if (! ((Z == Random2)
				|| (Random2 == Random1)))
				printf("1 * Z == %g\n", Random2);
			if (! (Z == V9)) printf("Z / 1 = %.17e\n", V9);
			if (Random2 != Random1) {
				ErrCnt [2] = ErrCnt [2] + 1;
				BadCond(2, "Multiplication does not commute!\n");
				printf("\tComparison alleges that 1 * Z = %.17e\n",
					Random2);
				printf("\tdiffers from Z * 1 = %.17e\n", Random1);
				}
			Pause();
			}
		}
	}

 void
notify(char * s)



{
	printf("%s test appears to be inconsistent...\n", s);
	printf("   PLEASE NOTIFY KARPINKSI!\n");
	}





 void
msglist(char ** s)



{ while(*s) printf("%s\n", *s++); }

 void
Instructions(void)
{
  static char *instr[] = {
	"Lest this program stop prematurely, i.e. before displaying\n",
	"    `END OF TEST',\n",
	"try to persuade the computer NOT to terminate execution when an",
	"error like Over/Underflow or Division by Zero occurs, but rather",
	"to persevere with a surrogate value after, perhaps, displaying some",
	"warning.  If persuasion avails naught, don't despair but run this",
	"program anyway to see how many milestones it passes, and then",
	"amend it to make further progress.\n",
	"Answer questions with Y, y, N or n (unless otherwise indicated).\n",
	0};

	msglist(instr);
	}

 void
Heading(void)
{
  static char *head[] = {
	"Users are invited to help debug and augment this program so it will",
	"cope with unanticipated and newly uncovered arithmetic pathologies.\n",
	"Please send suggestions and interesting results to",
	"\tRichard Karpinski",
	"\tComputer Center U-76",
	"\tUniversity of California",
	"\tSan Francisco, CA 94143-0704, USA\n",
	"In doing so, please include the following information:",



	"\tPrecision:\tdouble;",

	"\tVersion:\t10 February 1989;",
	"\tComputer:\n",
	"\tCompiler:\n",
	"\tOptimization level:\n",
	"\tOther relevant compiler options:",
	0};

	msglist(head);
	}

 void
Characteristics(void)
{
	static char *chars[] = {
	 "Running this program should reveal these characteristics:",
	"     Radix = 1, 2, 4, 8, 10, 16, 100, 256 ...",
	"     Precision = number of significant digits carried.",
	"     U2 = Radix/Radix^Precision = One Ulp",
	"\t(OneUlpnit in the Last Place) of 1.000xxx .",
	"     U1 = 1/Radix^Precision = One Ulp of numbers a little less than 1.0 .",
	"     Adequacy of guard digits for Mult., Div. and Subt.",
	"     Whether arithmetic is chopped, correctly rounded, or something else",
	"\tfor Mult., Div., Add/Subt. and Sqrt.",
	"     Whether a Sticky Bit used correctly for rounding.",
	"     UnderflowThreshold = an underflow threshold.",
	"     E0 and PseudoZero tell whether underflow is abrupt, gradual, or fuzzy.",
	"     V = an overflow threshold, roughly.",
	"     V0  tells, roughly, whether  Infinity  is represented.",
	"     Comparisions are checked for consistency with subtraction",
	"\tand for contamination with pseudo-zeros.",
	"     Sqrt is tested.  Y^X is not tested.",
	"     Extra-precise subexpressions are revealed but NOT YET tested.",
	"     Decimal-Binary conversion is NOT YET tested for accuracy.",
	0};

	msglist(chars);
	}

 void
History(void)
{ 
 


  static char *hist[] = {
	"The program attempts to discriminate among",
	"   FLAWs, like lack of a sticky bit,",
	"   Serious DEFECTs, like lack of a guard digit, and",
	"   FAILUREs, like 2+2 == 5 .",
	"Failures may confound subsequent diagnoses.\n",
	"The diagnostic capabilities of this program go beyond an earlier",
	"program called `MACHAR', which can be found at the end of the",
	"book  `Software Manual for the Elementary Functions' (1980) by",
	"W. J. Cody and W. Waite. Although both programs try to discover",
	"the Radix, Precision and range (over/underflow thresholds)",
	"of the arithmetic, this program tries to cope with a wider variety",
	"of pathologies, and to say how well the arithmetic is implemented.",
	"\nThe program is based upon a conventional radix representation for",
	"floating-point numbers, but also allows logarithmic encoding",
	"as used by certain early WANG machines.\n",
	"BASIC version of this program (C) 1983 by Prof. W. M. Kahan;",
	"see source comments for more history.",
	0};

	msglist(hist);
	}
