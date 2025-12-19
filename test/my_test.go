package test

import (
  "testing"
  "github.com/gruntwork-io/terratest/modules/terraform"
  "github.com/stretchr/testify/assert"
)

func TestResourceGroupModule(t *testing.T) {
  t.Parallel()

  terraformOptions := &terraform.Options{
    TerraformDir: "../Environment/dev",  // Point to parent module folder
    NoColor:      true,
  }

  defer terraform.Destroy(t, terraformOptions)
  terraform.InitAndApply(t, terraformOptions)

  // Validate output or resource existence (example)
  // Adjust output key as per your outputs.tf if you have any
  output := terraform.Output(t, terraformOptions, "some_output_name")
  assert.NotEmpty(t, output)
}
