package test

import (
	"testing"
	"fmt"
	"errors"
	"github.com/stretchr/testify/assert"
)

func WaitFor(noOfRetries int, function func()bool) error {
	isSuccess := false

	for i := 1; i <= noOfRetries; i++ {
		if isSuccess {
			return nil
		} 
		isSuccess = function()
	}
	return errors.New(fmt.Sprintf("function failed to return true after %d retries", noOfRetries))
}

func TestWaitForFailsWhenFalseReturned(t *testing.T) {
	functionRan := false
	
	err := WaitFor(1, func()bool {
		functionRan = true
		return false
	})
	assert.Error(t, err)
	assert.Equal(t, "function failed to return true after 1 retries", err.Error())
	assert.True(t, functionRan)
}

func TestWaitForRetries(t *testing.T) {
	count := 0
	
	WaitFor(3,func()bool {
		count++
		return false
	})
	assert.Equal(t, 3, count)
}