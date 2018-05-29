package handler

import (
	"net/http"

	"apiserver/model"
	"apiserver/pkg/errno"

	"github.com/gin-gonic/gin"
)

func SendResponse(c *gin.Context, err error, data interface{}) {
	code, message := errno.DecodeErr(err)

	// always return http.StatusOK
	c.JSON(http.StatusOK, model.Response{
		Code:    code,
		Message: message,
		Data:    data,
	})
}
