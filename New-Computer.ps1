<#
.SYNOPSIS
Setup New Windows Computer for Kroger H&W Devops Associates

.DESCRIPTION
Install recommended applications
Install Visual Studio Code extensions
Configure Git

.PARAMETER username
Kroger github username

.PARAMETER email
Kroger github email address

.EXAMPLE
New-Computer -username spencer-kimball-kr -email spencer.kimball@kroger.com

.NOTES

#>
function New-Computer {
    param (
        [string]$username,
        [string]$email
    )
    
    $apps = @(
        'Notepad++.Notepad++',
        'Microsoft.VisualStudioCode',
        '7zip.7zip',
        'Git.Git',
        'WinSCP.WinSCP',
        'GitHub.cli',
        'Microsoft.WindowsTerminal',
        'Docker.DockerDesktop'
    )

    $extensions = @(
        'hashicorp.terraform',
        'ms-python.isort',
        'ms-python.python',
        'ms-python.vscode-pylance',
        'redhat.ansible',
        'redhat.vscode-yaml',
        'snyk-security.snyk-vulnerability-scanner',
        'timonwong.shellcheck',
        'wholroyd.jinja'
    )

    foreach ($app in $apps) {
        winget install $app --accept-package-agreements
    }

    foreach ($extension in $extensions) {
        code --install-extension $extension
    }

    git config --global user.name $username
    git config --global user.email $email
    git config --global core.editor code
    git config --global -l
}