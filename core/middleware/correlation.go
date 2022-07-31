// Copyright 2022 Clivern. All rights reserved.
// Use of this source code is governed by the MIT
// license that can be found in the LICENSE file.

package middleware

import (
	"strings"

	"github.com/clivern/mammal/core/util"

	"github.com/labstack/echo/v4"
)

// Correlation middleware
func Correlation(next echo.HandlerFunc) echo.HandlerFunc {
	return func(c echo.Context) error {
		corralationID := c.Request().Header.Get("X-Request-ID")

		if strings.TrimSpace(corralationID) == "" {
			corralationID = util.NewCorrelation().UUIDv4()

			c.Request().Header.Set(
				"X-Request-ID",
				corralationID,
			)
		}

		c.Response().Header().Set(
			"X-Request-ID",
			corralationID,
		)

		return next(c)
	}
}
