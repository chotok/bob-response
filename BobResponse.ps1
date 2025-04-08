Function Get-BobResponse() {
    <#
    .SYNOPSIS
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.
    
    .DESCRIPTION
    Bob is a lackadaisical teenager. In conversation, his responses are very limited.

    Bob answers 'Sure.' if you ask him a question.

    He answers 'Whoa, chill out!' if you yell at him.

    He answers 'Calm down, I know what I'm doing!' if you yell a question at him.

    He says 'Fine. Be that way!' if you address him without actually saying
    anything.

    He answers 'Whatever.' to anything else.
    
    .PARAMETER HeyBob
    The sentence you say to Bob.
    
    .EXAMPLE
    Get-BobResponse -HeyBob "Hi Bob"
    #>
    [CmdletBinding()]
    Param(
        [string]$HeyBob
    )
    #Removes whitespaces from the beginning and the end, also removed `n `r `t `$
    $HeyBob = $HeyBob.Trim()

    If (-Not $HeyBob) {
        return 'Fine. Be that way!'
    } ElseIf ($HeyBob -ceq $HeyBob.ToUpper() -and $HeyBob -match '[A-Z]' -and $HeyBob[-1] -eq '?') {
        return "Calm down, I know what I'm doing!"
    } ElseIf ($HeyBob -ceq $HeyBob.ToUpper() -and $HeyBob -match '[A-Z]') {
        return 'Whoa, chill out!'
    } ElseIf ($HeyBob[-1] -eq '?') {
        return 'Sure.'
    } Else {
        return 'Whatever.'
    }
}
