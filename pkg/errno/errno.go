package errno

type Errno struct {
	Code    int
	Message string
}

func (err Errno) Error() string {
	return err.Message
}

// Err represents an error
type Err struct {
	Code    int
	Message string
	Err     error
}

func New(errno *Errno, err error) *Err {
	return &Err{Code: errno.Code, Message: errno.Message, Err: err}
}

func (err Err) Error() string {
	if err.Err != nil {
		return err.Err.Error()
	}

	return err.Message
}

func DecodeErr(err error) (int, string) {
	if err == nil {
		return OK.Code, OK.Message
	}

	if e, ok := err.(*Err); ok {
		return e.Code, e.Message
	}

	if e, ok := err.(*Errno); ok {
		return e.Code, e.Message
	}

	return InternalServerError.Code, err.Error()
}
