$here = $PSScriptRoot
$sut = (Split-Path -Leaf $MyInvocation.MyCommand.Path) -replace '\.Tests\.', '.'

$modulePath = "$here\..\..\.."
$moduleName = Split-Path -Path $modulePath -Leaf

InModuleScope $moduleName {
    Describe class1 {
        Context 'Type creation' {
            It 'Has created a type named class1' {
                'class1' -as [Type] | Should -BeOfType [Type]
            }
        }

        Context 'Constructors' {
            It 'Has a default constructor' {
                $instance = [class1]::new()
                $instance | Should -Not -BeNullOrEmpty
                $instance.GetType().Name | Should -Be 'class1'
            }
        }

        Context 'Methods' {
            BeforeEach {
                $instance = [class1]::new()
            }

            It 'Overrides the ToString method' {
                # Typo "calss" is inherited from definition. Preserved here as validation is demonstrative. 
                $instance.ToString() | Should -Be 'This calss is class1'
            }
        }

        Context 'Properties' {
            BeforeEach {
                $instance = [class1]::new()
            }

            It 'Has a Name property' {
                $instance.Name | Should -Be 'Class1'
            }
        }
    }
}